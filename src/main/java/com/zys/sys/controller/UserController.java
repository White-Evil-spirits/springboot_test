package com.zys.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zys.sys.common.Constast;
import com.zys.sys.common.DataGridView;
import com.zys.sys.common.ResultObj;
import com.zys.sys.domain.Dept;
import com.zys.sys.domain.User;
import com.zys.sys.service.DeptService;
import com.zys.sys.service.UserService;
import com.zys.sys.vo.UserVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
    private UserService userService;

    @Autowired
    private DeptService deptService;

    @RequestMapping("loadAllUser")
    public DataGridView loadAllUser(UserVo userVo){
        IPage<User> page = new Page<>(userVo.getPage(),userVo.getLimit());
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StringUtils.isNotBlank(userVo.getName()),"name",userVo.getName()).or().eq(StringUtils.isNotBlank(userVo.getLoginname()),"loginname",userVo.getLoginname());
        queryWrapper.eq(StringUtils.isNotBlank(userVo.getAddress()),"address",userVo.getAddress());
        queryWrapper.eq("type",Constast.USER_TYPE_NORMAL);
        queryWrapper.eq(userVo.getDeptid()!=null,"deptid",userVo.getDeptid());
        this.userService.page(page,queryWrapper);
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

}

