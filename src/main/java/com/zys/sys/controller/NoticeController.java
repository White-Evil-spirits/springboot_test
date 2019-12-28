package com.zys.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zys.sys.common.DataGridView;
import com.zys.sys.common.ResultObj;
import com.zys.sys.common.WebUtils;
import com.zys.sys.domain.Notice;
import com.zys.sys.domain.User;
import com.zys.sys.service.NoticeService;
import com.zys.sys.vo.NoticeVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 小张666
 * @since 2019-12-27
 */
@RestController
@RequestMapping("notice")
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    //查看所有公告
    @RequestMapping("loadAllNotice")
    public DataGridView locadAllNotice(NoticeVo noticeVo){
        IPage<Notice> page = new Page(noticeVo.getPage(),noticeVo.getLimit());
        QueryWrapper<Notice> queryWrapper = new QueryWrapper();
        queryWrapper.like(StringUtils.isNotBlank(noticeVo.getTitle()),"title",noticeVo.getTitle());
        queryWrapper.like(StringUtils.isNotBlank(noticeVo.getOpername()),"opername",noticeVo.getOpername());
        queryWrapper.ge(noticeVo.getStrartTime()!=null,"createtime",noticeVo.getStrartTime());
        queryWrapper.le(noticeVo.getEndTime()!=null,"createtime",noticeVo.getEndTime());
        queryWrapper.orderByDesc("createtime");
        this.noticeService.page(page,queryWrapper);
        return new DataGridView(page.getTotal(),page.getRecords());
    }


    /*
    * 添加新公告
    * */
    @RequestMapping("addNotice")
    public ResultObj addNotice(NoticeVo noticeVo){
        try {
            noticeVo.setCreatetime(new Date());
            User user = (User) WebUtils.getSession().getAttribute("user");
            noticeVo.setOpername(user.getName());
            this.noticeService.save(noticeVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /*
    * 修改数据
    * */
    @RequestMapping("updateNotice")
    public ResultObj updateNotice(NoticeVo noticeVo){
        try{
            this.noticeService.updateById(noticeVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }

    }

    /*
    * 删除
    * */
    @RequestMapping("deleteNotice")
    public ResultObj deleteNotice(Integer id){
        try {
            this.noticeService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }

    }


    /*
     * 批量删除
     * */
    @RequestMapping("batchDeleteNotice")
    public ResultObj batchDeleteNotice(Integer[] ids){
        try{
            List<Integer> list = new ArrayList<>();
            for (Integer id : ids) {
                list.add(id);
            }
            this.noticeService.removeByIds(list);
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}

