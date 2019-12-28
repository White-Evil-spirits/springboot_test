package com.zys.sys.controller;

import com.zys.sys.common.ResultObj;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("sys")
public class SystemController {
    /*
    跳转到登陆页面
     */
    @RequestMapping("toLogin")
    public String toLogin(){
        return "system/index/login";
    }

    //跳转到首页
    @RequestMapping("index")
    public String index(){
        return "system/index/index";
    }

    /*
    跳转到工作台首页
     */
    @RequestMapping("toDeskManager")
    public String toDeskManager(){
        return "system/index/deskManager";
    }

    /*
    跳转到 loginfo页面
     */
    @RequestMapping("toLogLoginManager")
    public String toLoginfoManager(){
        return "system/loginfo/loginfoManager";
    }

    /*
    跳转到公告
     */
    @RequestMapping("toNoticeManager")
    public String toNoticeManager(){
        return "system/notice/noticeManager";
    }

    /*
    * 人员管理总页面
    * */

    @RequestMapping("toDeptManager")
    public String toDeptManager(){
        return "system/dept/deptManager";
    }
    /*
    * 跳转到 左侧人员管理
    * */
    @RequestMapping("toDeptLeft")
    public String toDeptLeft(){
        return "system/dept/deptLeft";
    }
    /*
     * 跳转到 右侧人员管理
     * */
    @RequestMapping("toDeptRight")
    public String toDeptRight(){
        return "system/dept/deptRight";
    }
}
