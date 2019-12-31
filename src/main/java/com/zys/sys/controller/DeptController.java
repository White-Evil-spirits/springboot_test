package com.zys.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zys.sys.common.DataGridView;
import com.zys.sys.common.ResultObj;
import com.zys.sys.common.TreeNode;
import com.zys.sys.domain.Dept;
import com.zys.sys.service.DeptService;
import com.zys.sys.vo.DeptVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 小张666
 * @since 2019-12-28
 */
@RestController
@RequestMapping("dept")
public class DeptController {

    @Autowired
    DeptService deptService;

    //加载木门管理dree
    @RequestMapping("loadDeptManagerLeftTreeJson")
    public DataGridView loadDeptManagerLeftTreeJson(){
        List<Dept> list = this.deptService.list();
        List<TreeNode> list2 = new ArrayList<>();
        for (  Dept dept : list ) {
            Boolean grs = dept.getOpen() == 1 ? true : false ;
            list2.add(new TreeNode(dept.getId(),dept.getPid(),dept.getTitle(),grs));
        }
/*        for (int i = 0; i < list2.size(); i++) {
            System.out.println(list2.get(i).toString()+"----------------------");
        }*/
        return new DataGridView(list2);
    }

    /*
    查询所有
     */
    @RequestMapping("loadAllDept")
    public DataGridView loadAllDept(DeptVo deptVo){
        IPage<Dept> page = new Page<>(deptVo.getPage(),deptVo.getLimit());
        QueryWrapper<Dept> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(deptVo.getAddress()),"address",deptVo.getAddress());
        queryWrapper.like(StringUtils.isNotBlank(deptVo.getRemark()),"remark",deptVo.getRemark());
        queryWrapper.like(StringUtils.isNotBlank(deptVo.getTitle()),"title",deptVo.getTitle());
        queryWrapper.eq(deptVo.getId()!=null,"id",deptVo.getId()).or().eq(deptVo.getId()!=null,"pid",deptVo.getId());
        queryWrapper.orderByDesc("available");
        this.deptService.page(page,queryWrapper);
        return new DataGridView(page.getTotal(),page.getRecords());
    }


    /*
    * addDept
    * 添加新的部门
    * */
    @RequestMapping("addDept")
    public ResultObj addDept(Dept dept){
        System.out.println(dept.toString()+"6661111111111111111111");
        try{
            dept.setCreatetime(new Date());
            this.deptService.save(dept);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /*
    * loadDeptMaxOrderNum
    * 获取当前排序数字然后+1
    * */
    @RequestMapping("loadDeptMaxOrderNum")
    public Map<String,Object> loadDeptMaxOrderNum(){
        Map<String,Object> map = new HashMap<String,Object>();
        QueryWrapper<Dept> queryWrapper =new QueryWrapper<>();
//        queryWrapper.orderByDesc("ordernum");
        Integer count = this.deptService.count();
        map.put("value",count+1);
        return map;
    }

    /*
    * checkDeptHasChildrenNode
    * 删除部门和子部门
    * */
    @RequestMapping("checkDeptHasChildrenNode")
    public Map<String,Object> checkDeptHasChildrenNode(Integer id){
//        System.out.println(id);
        Map<String,Object> map = new HashMap<>();
        QueryWrapper<Dept> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("pid",id);
        Integer count = this.deptService.count(queryWrapper);
        map.put("value",count);
        return map;
    }

    /*
    * deleteDept
    * 仅仅删除子部门
    * */
    @RequestMapping("deleteDept")
    public ResultObj deleteDept(Integer id){
        try{
            QueryWrapper<Dept> queryWrapper = new QueryWrapper<>();
            this.deptService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }

    }

}

