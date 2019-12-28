package com.zys.sys.controller;

import com.zys.sys.common.ActiverUser;
import com.zys.sys.common.ResultObj;
import com.zys.sys.common.WebUtils;
import com.zys.sys.domain.Loginfo;
import com.zys.sys.service.LoginfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("login")
public class LoginController {

    @Autowired
    LoginfoService loginfoService;

    @RequestMapping("login")
    public ResultObj login(String loginname, String pwd){
        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken token = new UsernamePasswordToken(loginname,pwd);
        try{
            subject.login(token);
            ActiverUser activerUser=(ActiverUser) subject.getPrincipal();
            System.out.println(activerUser.toString());
            WebUtils.getSession().setAttribute("user",activerUser.getUser());
            //记录登录日志，插入登录表
            System.out.println(WebUtils.getRequest().getRemoteAddr());
            Loginfo loginfo = new Loginfo();
            loginfo.setLoginname(activerUser.getUser().getName()+"-"+activerUser.getUser().getLoginname());
            loginfo.setLoginip(WebUtils.getRequest().getRemoteAddr());
            loginfo.setLogintime(new Date());
            this.loginfoService.save(loginfo);
            return ResultObj.LOGIN_SUCCESS;
        }catch (AuthenticationException e){
            return ResultObj.LOGIN_ERROR;
        }
    }
}
