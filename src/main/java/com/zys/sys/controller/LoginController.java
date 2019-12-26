package com.zys.sys.controller;

import com.zys.sys.common.ActiverUser;
import com.zys.sys.common.ResultObj;
import com.zys.sys.common.WebUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/login")
public class LoginController {

    @RequestMapping("/login")
    public ResultObj login(String loginname, String pwd){
        System.out.println(loginname);
        System.out.println();
        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken token = new UsernamePasswordToken(loginname,pwd);
        try{
            subject.login(token);
            ActiverUser activerUser=(ActiverUser) subject.getPrincipal();
            System.out.println(activerUser.toString());
            WebUtils.getSession().setAttribute("user",activerUser.getUser());
            return ResultObj.LOGIN_SUCCESS;
        }catch (AuthenticationException e){
            return ResultObj.LOGIN_ERROR;
        }
    }
}
