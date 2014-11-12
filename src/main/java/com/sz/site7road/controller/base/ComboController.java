package com.sz.site7road.controller.base;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
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

    String[] iconArray={
            "请选择",
            "icon-man",
            "icon-add",
            "icon-remove",
            "icon-edit",
            "icon-search",
            "icon-cancel",
            "icon-cut",
            "icon-clear",
            "icon-filter",
            "icon-help",
            "icon-lock",
            "icon-no",
            "icon-ok",
            "icon-print",
            "icon-redo",
            "icon-reload",
            "icon-sum",
            "icon-tip",
            "icon-undo",
            "icon-save"
    };

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


    @RequestMapping(value = "icon")
    @ResponseBody
    public List<ComboTreeResponse>  getIconCombo() {

        /**
         *   <input type="radio" name="l value="icon-man"       ><span class="icon-man">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-add"         ><span class="icon-add">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-remove"        ><span class="icon-remove">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-edit"            ><span class="icon-edit">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-search"          ><span class="icon-search">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-cancel"           ><span class="icon-cancel">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-cut"      ><span class="icon-cut">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-clear"    ><span class="icon-clear">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-filter"    ><span class="icon-filter">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-help"     ><span class="icon-help">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-lock"    ><span class="icon-lock">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-no"      ><span class="icon-no">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-ok>       <span class="icon-ok">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-print"    ><span class="icon-print">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-redo"    ><span class="icon-redo">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-reload"    ><span class="icon-reload">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-sum"      ><span class="icon-sum">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-tip"     ><span class="icon-tip">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-undo"    ><span class="icon-undo">&nbsp;&nbsp;&nbsp;</span><br/>
         <input type="radio" name="lang" value="icon-save"   ><span class="icon-save">&nbsp;&nbsp;&nbsp;</span>
         */
        List<ComboTreeResponse>  comboTreeResponseList= Lists.newLinkedList();

        for(int i=0;i<iconArray.length;i++)
        {
            ComboTreeResponse comboTreeResponse=new ComboTreeResponse();
            comboTreeResponse.setId(i);
            comboTreeResponse.setText(iconArray[i]);
            comboTreeResponse.setIconCls(iconArray[i]);
            comboTreeResponseList.add(comboTreeResponse);
        }
        return  comboTreeResponseList;
    }

}
