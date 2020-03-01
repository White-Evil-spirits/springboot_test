package com.zys.sys.controller;


import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zys.sys.common.Constast;
import com.zys.sys.common.DataGridView;
import com.zys.sys.common.PinyinUtils;
import com.zys.sys.common.ResultObj;
import com.zys.sys.domain.Dept;
import com.zys.sys.domain.Role;
import com.zys.sys.domain.User;
import com.zys.sys.service.DeptService;
import com.zys.sys.service.RoleService;
import com.zys.sys.service.UserService;
import com.zys.sys.vo.UserVo;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 小张666
 * @since 2019-12-24
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    @Lazy   //懒加载
    private UserService userService;

    @Autowired
    private DeptService deptService;

    @Autowired
    RoleService roleService;

    @RequestMapping("loadAllUser")
    public DataGridView loadAllUser(UserVo userVo){
        IPage<User> page = new Page<>(userVo.getPage(),userVo.getLimit());
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StringUtils.isNotBlank(userVo.getName()),"name",userVo.getName()).or().eq(StringUtils.isNotBlank(userVo.getLoginname()),"loginname",userVo.getLoginname());
        queryWrapper.eq(StringUtils.isNotBlank(userVo.getAddress()),"address",userVo.getAddress());
        queryWrapper.eq("type",Constast.USER_TYPE_NORMAL);
        queryWrapper.eq(userVo.getDeptid()!=null,"deptid",userVo.getDeptid());
        this.userService.page(page,queryWrapper);
/*        for ( User user : page.getRecords() ) {
            System.out.println(user.toString()+"=========================");
        }*/
        List<User> list = page.getRecords();
        for (User user : list) {
            Integer deptid = user.getDeptid();
            if(deptid!=null) {
                Dept one =deptService.getById(deptid);
                user.setDeptname(one.getTitle());
            }
            Integer mgr = user.getMgr();
            if(mgr!=null) {
                User one = this.userService.getById(mgr);
                user.setLeadername(one.getName());
            }
        }
        return new DataGridView(page.getTotal(), list);
    }


    //添加user
    //addUser
    @RequestMapping("addUser")
    public ResultObj addUser(UserVo userVo){
        try{
            String yan = IdUtil.simpleUUID().toUpperCase();
            userVo.setSalt(yan);
            userVo.setType(Constast.USER_TYPE_NORMAL);
            userVo.setPwd(new Md5Hash(Constast.USER_DEFAULT_PWD,yan,2).toString());
            userVo.setHiredate(new Date());
            this.userService.save(userVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /*
    * loadUserMaxOrderNum
    * 初始化排序码
    * */
    @RequestMapping("loadUserMaxOrderNum")
    public Map<String,Integer> loadUserMaxOrderNum(){
        Map<String,Integer> map = new HashMap<>();
        Integer maxNum = this.userService.maxNum();
        map.put("value",maxNum+1);
        return map;
    }


    /*
    * 根据部门id查询用户
    *loadUsersByDeptId
    * */
    @RequestMapping("loadUsersByDeptId")
    public DataGridView loadUsersByDeptId(Integer deptid){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(deptid!=null,"deptid",deptid);
        queryWrapper.eq("available",Constast.AVAILABLE_TRUE);
        queryWrapper.eq("type",Constast.USER_TYPE_NORMAL);
        List<User> list = this.userService.list(queryWrapper);
        return new DataGridView(list);
    }

    /*
    * changeChineseToPinyin
    * 转换成登录名  中文——》拼音
    * */
    @RequestMapping("changeChineseToPinyin")
    public Map<String,Object> changeChineseToPinyin(String username){
        Map<String,Object> map = new HashMap<>();
        if(username != null){
            map.put("value", PinyinUtils.getPingYin(username));
        }else{
            map.put("value","");
        }
        return map;
    }


    /*
    *  修改用户
    *   updateUser
    * */
    @RequestMapping("updateUser")
    public ResultObj updateUser(User user){
        try{
            System.out.println(user.toString());
            this.userService.updateById(user);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /*
    * 查询一个用户
    *loadUserById
    * */
    @RequestMapping("loadUserById")
    public DataGridView loadUserById(Integer id){
        User user = this.userService.getById(id);
        return new DataGridView(user);
    }


    /*
    * deleteUser
    * 删除用户和关系表
    * */
    @RequestMapping("deleteUser")
    public ResultObj deleteUser(@Param("id") Integer id){
//        System.out.println(id+"=====000000000000000000000000000000000000");
        try{
            this.userService.removeById(id);

            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }

    }

    /*
    * 重置密码
    * resetPwd
    * */
    @RequestMapping("resetPwd")
    public ResultObj resetPwd(Integer id){
        try{
            User user = new User();
            user.setId(id);
            String yan = IdUtil.simpleUUID().toUpperCase();
            user.setSalt(yan);
            user.setType(Constast.USER_TYPE_NORMAL);
            user.setPwd(new Md5Hash(Constast.USER_DEFAULT_PWD,yan,2).toString());
            this.userService.updateById(user);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 根据用户ID查询角色并选中已拥有的角色
     */
    @RequestMapping("initRoleByUserId")
    public DataGridView initRoleByUserId(Integer id) {
        //1,查询所有可用的角色
        QueryWrapper<Role> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("available", Constast.AVAILABLE_TRUE);
        List<Map<String, Object>> listMaps = this.roleService.listMaps(queryWrapper);
//        for ( Map<String, Object> map : listMaps ) {
//            for (String key : map.keySet()) {
//                System.out.println(key + ":" + map.get(key)+"listmap--++++++++++++++++++++++++++++++++++++");
//            }
//            System.out.println("截断一侧输出++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        }
        //2,查询当前用户拥有的角色ID集合
        List<Integer> currentUserRoleIds=this.roleService.queryUserRoleIdsByUid(id);
        for (Map<String, Object> map : listMaps) {
            Boolean LAY_CHECKED=false;
            Integer roleId=(Integer) map.get("id");
            for (Integer rid : currentUserRoleIds) {
                if(rid==roleId) {
                    LAY_CHECKED=true;
                    break;
                }
            }
            map.put("LAY_CHECKED", LAY_CHECKED);
        }
        return new DataGridView(Long.valueOf(listMaps.size()), listMaps);
    }

    /**
     * 保存用户和角色的关系
     */
    @RequestMapping("saveUserRole")
    public ResultObj saveUserRole(@Param("uid")Integer uid, @Param("ids")Integer[] ids) {
        try {
            this.userService.saveUserRole(uid,ids);
            return ResultObj.DISPATCH_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }

    }
}

