package com.zys.sys.mapper;

import com.zys.sys.domain.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 小张666
 * @since 2019-12-24
 */
public interface UserMapper extends BaseMapper<User> {

    Integer maxNum();

    void saveUserRole(Integer uid, List<Integer> ids);
}
