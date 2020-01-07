package com.zys.sys.service;

import com.zys.sys.domain.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 小张666
 * @since 2020-01-03
 */
public interface RoleService extends IService<Role> {


    List<Integer> queryRolePermissionIdsByRid(Integer roleId);

    void saveRolePermission(Integer rid, Integer[] ids);


    //
    List<Integer> queryUserRoleIdsByUid(Integer id);
}
