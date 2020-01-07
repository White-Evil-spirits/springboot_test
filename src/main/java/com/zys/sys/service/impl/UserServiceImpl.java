package com.zys.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.zys.sys.domain.User;
import com.zys.sys.mapper.RoleMapper;
import com.zys.sys.mapper.UserMapper;
import com.zys.sys.service.RoleService;
import com.zys.sys.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 小张666
 * @since 2019-12-24
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public boolean save(User entity) {
        return super.save(entity);
    }

    @Override
    public boolean updateById(User entity) {
        return super.updateById(entity);
    }

    @Override
    public User getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public boolean removeById(Serializable id) {
        roleMapper.deleteRandUById(id);
        return super.removeById(id);
    }

    public Integer maxNum(){
        return this.getBaseMapper().maxNum();
    }

    @Override
    public void saveUserRole(Integer uid, Integer[] ids) {

    }

    ;
}
