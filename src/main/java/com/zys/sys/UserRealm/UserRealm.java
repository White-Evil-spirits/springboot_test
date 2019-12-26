package com.zys.sys.UserRealm;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zys.sys.common.ActiverUser;
import com.zys.sys.domain.User;
import com.zys.sys.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

public class UserRealm extends AuthorizingRealm {


    @Autowired
    UserService userService;

    @Override
    public String getName() {
        return this.getClass().getName();
    }

    @Override
    //认证方法
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        return null;
    }

    @Override
    //授权方法
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        QueryWrapper<User> querywapper = new QueryWrapper<>();
        System.out.println(token.getCredentials()+"mmmmmmmmmmmmmmmmmmmmmmmmmmmm");
        System.out.println(token.getPrincipal()+"mmmmmmmmmmmmmmmmmmmmmmmmmmmm");
        querywapper.eq("loginname",token.getPrincipal().toString());
        User user = userService.getOne(querywapper);
        if(null != user){
            ActiverUser auser = new ActiverUser();
            auser.setUser(user);
            ByteSource bs = ByteSource.Util.bytes(user.getSalt());
//            System.out.println(bs+"----------------------------------");
            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(auser,user.getPwd(),bs,this.getName());
            return info;
        }
        return null;
    }
}

