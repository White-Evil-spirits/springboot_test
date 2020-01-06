package com.zys.sys.service.impl;

import com.zys.sys.domain.Role;
import com.zys.sys.mapper.RoleMapper;
import com.zys.sys.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 小张666
 * @since 2020-01-03
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Override
    public boolean removeById(Serializable id) {

        //根据角色id删除关系表sys_role_permission
        this.getBaseMapper().deletePById(id);

        //根据角色id删除关系表sys_role_user
        this.getBaseMapper().deleteRById(id);


        return super.removeById(id);
    }

    public List<Integer> queryRolePermissionIdsByRid(Integer roleId) {
        return this.getBaseMapper().queryRolePermissionIdsByRid(roleId);
    }

    @Override
    public void saveRolePermission(Integer rid, Integer[] ids) {
        //先删除
        this.getBaseMapper().deleteById(rid);
        List<Integer> list = new ArrayList<>();
        if(ids!=null && ids.length>0){
            for ( Integer id : ids ) {
                list.add(id);
            }
            this.getBaseMapper().saveRolePermission(rid,list);
        }
    }
}
