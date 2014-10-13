package com.sz.site7road.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/10/13 9:59.
 * remark:测试的控制器
 */
@Controller
@RequestMapping(value = "/test")
public class TestController {

    @RequestMapping(value = "/{htmlName}")
    public String testFtl(@PathVariable(value = "htmlName") String htmlName)
    {
        return  "test/"+htmlName;
    }

}
