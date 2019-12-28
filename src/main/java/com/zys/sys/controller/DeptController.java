package com.zys.sys.controller;


import com.zys.sys.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 小张666
 * @since 2019-12-28
 */
@RestController
@RequestMapping("dept")
public class DeptController {

    @Autowired
    DeptService deptService;



}

