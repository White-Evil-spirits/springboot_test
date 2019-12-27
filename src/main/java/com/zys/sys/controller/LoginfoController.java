package com.zys.sys.controller;



import java.util.ArrayList;

import java.util.List;

import com.zys.sys.common.ResultObj;
import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zys.sys.common.DataGridView;
import com.zys.sys.domain.Loginfo;
import com.zys.sys.service.LoginfoService;
import com.zys.sys.vo.LoginfoVo;

/**
 * <p>
 *  前端控制器
 * </p>
 * 登录日志
 * @author 小张666
 * @since 2019-12-27
 */
@RestController
@RequestMapping("loginfo")
public class LoginfoController {

    @Autowired
    LoginfoService loginfoService;

    /*
    全查询
     */
    @RequestMapping("loadAllLoginfo")
    public DataGridView loadAllLoginfo(LoginfoVo loginfoVo){
        IPage<Loginfo> page = new Page<>(loginfoVo.getPage(), loginfoVo.getLimit());
        QueryWrapper<Loginfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(loginfoVo.getLoginname()),"loginname", loginfoVo.getLoginname());
        queryWrapper.like(StringUtils.isNotBlank(loginfoVo.getLoginip()),"loginip",loginfoVo.getLoginip());
        queryWrapper.ge(loginfoVo.getStrartTime()!=null,"loginname",loginfoVo.getLoginname());
        queryWrapper.le(loginfoVo.getEndTime()!=null,"loginname",loginfoVo.getLoginname());
        queryWrapper.orderByDesc("logintime");
        this.loginfoService.page(page, queryWrapper);
        queryWrapper.orderByDesc("logintime");
        return new DataGridView(page.getTotal(), page.getRecords());
    }


    /*
    删除一条loginfo
     */
    @RequestMapping("deleteLoginfo")
    public ResultObj deleteLoginfo(Integer id){

        try{
            this.loginfoService.removeById(id);
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    /*
    批量删除
     */
    @RequestMapping("batchDeleteLoginfo")
    public ResultObj batchDeleteLoginfo(LoginfoVo loginfoVo){
        try{
            List<Integer> list =new ArrayList<>();
            for (Integer id : loginfoVo.getIds()) {
                list.add(id);
            }
            this.loginfoService.removeByIds(list);
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }

    }



}

