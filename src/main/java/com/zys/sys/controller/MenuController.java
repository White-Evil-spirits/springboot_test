package com.zys.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zys.sys.common.*;
import com.zys.sys.domain.Permission;
import com.zys.sys.domain.User;
import com.zys.sys.service.PermissionService;
import com.zys.sys.vo.PermissionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/menu")
public class MenuController {



    @Autowired
    private PermissionService permissionService;

    @RequestMapping("loadIndexLeftMenuJson")
    public DataGridView loadIndexLeftMenuJson(PermissionVo permissionVo){

        //查询所有菜单
        QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type", Constast.TYPE_MNEU);
        queryWrapper.eq("available", Constast.AVAILABLE_TRUE);
        List<Permission> list = new ArrayList<>();
        User user = (User) WebUtils.getSession().getAttribute("user");
        if(user.getType() == Constast.USER_TYPE_SUPER){
            list = permissionService.list(queryWrapper);
        }else{
            //根据用户id  角色 权限查
            list = permissionService.list(queryWrapper);
        }

        List<TreeNode> treeNodes=new ArrayList<>();
        for (Permission p : list) {
            Integer id=p.getId();
            Integer pid=p.getPid();
            String title=p.getTitle();
            String icon=p.getIcon();
            String href=p.getHref();
            Boolean spread=p.getOpen()==Constast.OPEN_TRUE?true:false;
            treeNodes.add(new TreeNode(id, pid, title, icon, href, spread));
        }
        //构造层级关系
        List<TreeNode> list2 = TreeNodeBuilder.build(treeNodes, 1);
        System.out.println(list2);
        DataGridView dataGridView = new DataGridView(list2);
        return dataGridView;
    }
}
