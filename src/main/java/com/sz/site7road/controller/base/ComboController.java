package com.sz.site7road.controller.base;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.io.Files;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.combotree.FileComboTreeResponse;
import com.sz.site7road.framework.combotree.IconComboTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/10/13 15:02.
 * remark:从后端获取的下拉菜单数据
 */
@Controller
@RequestMapping("/combo")
public class ComboController {
    private static final Logger log = Logger.getLogger(ComboController.class);

    String[] iconArray = {
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
            "icon-save",
            "icon-tv",
            "icon-wheel",
            "icon-computer",
            "icon-door",
            "icon-cup",
            "icon-world",
            "icon-book"

    };


    @RequestMapping(value = "gender")
    @ResponseBody
    public List<Map<String, Object>> getSexCombo() {

        List<Map<String, Object>> gender = Lists.newLinkedList();
        Map<String, Object> man = Maps.newHashMap();
        man.put("id", "0");
        man.put("name", "男");
        gender.add(man);

        Map<String, Object> woman = Maps.newHashMap();
        woman.put("id", "1");
        woman.put("name", "女");
        gender.add(woman);
        return gender;
    }


    @RequestMapping(value = "icon")
    @ResponseBody
    public List<ComboTreeResponse> getIconCombo(ServletRequest request) {


        return IconComboTree.getIconComboTreeResponseList();
    }

    @RequestMapping(value = "{path}/template")
    @ResponseBody
    public List<FileComboTreeResponse> getTemplateComboTree(@PathVariable(value = "path") String path, ServletRequest request) {
        //读取目录下的ftl文件,返回树形结构
        List<FileComboTreeResponse> tree = Lists.newLinkedList();

        String realPath = request.getServletContext().getRealPath("/WEB-INF/page/");
        path = realPath +"/"+ path;
        File templatePath = new File(path);
        File[] templateFiles = templatePath.listFiles();
        if(templateFiles!=null&&templateFiles.length>0) {
            //先遍历文件夹
            for (File file : templateFiles) {
                if (file.isDirectory()) {
                    FileComboTreeResponse comboTreeResponse = new FileComboTreeResponse();
                    comboTreeResponse.setText(file.getName());
                    comboTreeResponse.setId(file.getName());
                    comboTreeResponse.setChildren(traverse(file.listFiles()));
                    tree.add(comboTreeResponse);
                }
            }
            //再遍历文件
            for (File file : templateFiles) {
                if (file.isFile()) {
                    FileComboTreeResponse comboTreeResponse = new FileComboTreeResponse();
                    comboTreeResponse.setText(file.getName());
                    comboTreeResponse.setId(file.getName());
                    comboTreeResponse.setChildren(null);
                    tree.add(comboTreeResponse);
                }
            }
        }


        return tree;
    }


    public  List<FileComboTreeResponse> traverse(File[] templateFiles){
        List<FileComboTreeResponse> fileComboTreeResponseList=Lists.newLinkedList();
        if(templateFiles!=null&&templateFiles.length>0) {
            //先遍历文件夹
            for (File file : templateFiles) {
                if (file.isDirectory()) {
                    FileComboTreeResponse comboTreeResponse = new FileComboTreeResponse();
                    comboTreeResponse.setText(file.getName());
                    comboTreeResponse.setId( file.getName());
                    comboTreeResponse.setChildren(traverse(file.listFiles()));
                    fileComboTreeResponseList.add(comboTreeResponse);
                }
            }
            //再遍历文件
            for (File file : templateFiles) {
                if (file.isFile()) {
                    FileComboTreeResponse comboTreeResponse = new FileComboTreeResponse();
                    comboTreeResponse.setText(file.getName());
                    comboTreeResponse.setId(file.getParentFile().getName()+"/"+file.getName());
                    comboTreeResponse.setChildren(null);
                    fileComboTreeResponseList.add(comboTreeResponse);
                }
            }
        }
        return fileComboTreeResponseList;
    }

}
