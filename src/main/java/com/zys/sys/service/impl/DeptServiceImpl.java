package com.zys.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.zys.sys.domain.Dept;
import com.zys.sys.mapper.DeptMapper;
import com.zys.sys.service.DeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.io.Serializable;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 小张666
 * @since 2019-12-28
 */
@Service
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept> implements DeptService {
    //做缓存

    @Override
    public boolean update(Wrapper<Dept> updateWrapper) {
        return super.update(updateWrapper);
    }

    @Override
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }

    @Override
    public boolean save(Dept entity) {
        return super.save(entity);
    }

    @Override
    public Dept getById(Serializable id) {
        return super.getById(id);
    }


}
