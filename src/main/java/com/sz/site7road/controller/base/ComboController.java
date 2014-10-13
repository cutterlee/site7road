package com.sz.site7road.controller.base;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/10/13 15:02.
 * remark:从后端获取的下拉菜单数据
 */
@Controller
@RequestMapping("/combo")
public class ComboController {

    @RequestMapping(value = "gender")
    @ResponseBody
    public List<Map<String, Object>> getSexCombo() {

        List<Map<String, Object>> gender= Lists.newLinkedList();
        Map<String,Object> man=Maps.newHashMap();
        man.put("id","0");
        man.put("name","男");
        gender.add(man);

        Map<String,Object> woman=Maps.newHashMap();
        woman.put("id","1");
        woman.put("name","女");
        gender.add(woman);
        return  gender;
    }

}
