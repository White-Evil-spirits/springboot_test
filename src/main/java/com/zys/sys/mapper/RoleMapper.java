package com.zys.sys.mapper;

import com.zys.sys.domain.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 小张666
 * @since 2020-01-03
 */
public interface RoleMapper extends BaseMapper<Role> {


    void deletePById(Serializable id);

    void deleteRById(Serializable id);

    List<Integer> queryRolePermissionIdsByRid(Integer roleId);

    void saveRolePermission(@Param("rid") Integer rid, @Param("ids") List<Integer> ids);

    void deleteRandUById(Serializable id);

    /**
     * 查询当前用户拥有的角色ID集合
     * @param id
     * @return
     */
    List<Integer> queryUserRoleIdsByUid(Integer id);
}
