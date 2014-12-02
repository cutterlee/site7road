package com.sz.site7road.framework.combotree;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/20 15:13.
 * remark:获得图标的comboTree
 */
public final class IconComboTree {

   static String cssFormatter=".icon-%s{ background:url('%s') no-repeat center center;}";

   static List<ComboTreeResponse>  iconComboTreeResponseList= Lists.newLinkedList();

    public static void init(ServletContext context)
    {
         List<ComboTreeResponse>  comboTreeResponseLinkedList= Lists.newLinkedList();
        AtomicInteger i=new AtomicInteger(1);
        try {
            String path=  WebUtils.getRealPath(context, "/static/js/easyui/themes/icons");
            if(!Strings.isNullOrEmpty(path))
            {
                File iconPath=new File(path);
                if(iconPath.exists()&&iconPath.isDirectory())
                {
                    File[] files= iconPath.listFiles(new FilenameFilter() {
                        @Override
                        public boolean accept(File dir, String name) {
                            if(dir.getName().endsWith(".png")||dir.isDirectory())
                            {
                                return true;
                            }
                            return false;
                        }
                    });
                    if(files!=null&&files.length>0)
                    {

                        for(File file:files) {

                            if(file.isFile())
                            {
                                ComboTreeResponse comboTreeResponse = new ComboTreeResponse();
                                comboTreeResponse.setId(i.get());
                                String iconCls = "icon-" + file.getName().replace(".png", "");
                                comboTreeResponse.setText(iconCls);
                                comboTreeResponse.setIconCls(iconCls);
                                i.incrementAndGet();
//                                System.out.println(String.format(cssFormatter,file.getName().replace(".png",""),"icons/"+file.getName()));
                                comboTreeResponse.setState("open");
                                comboTreeResponse.setChildren(null);
                                comboTreeResponseLinkedList.add(comboTreeResponse);
                            }
                        }
                        for(File file:files)
                        {
                            if(file.isDirectory())
                            {
                                ComboTreeResponse comboTreeResponse=new ComboTreeResponse();
                                comboTreeResponse.setId(i.get());
                                String iconCls="icon-"+file.getName().replace(".png","");
                                comboTreeResponse.setText(iconCls);
                                comboTreeResponse.setIconCls(iconCls);
                                i.incrementAndGet();
                                comboTreeResponse.setState("closed");
                                //如果是目录,进去遍历
                                comboTreeResponse.setChildren(readIcon(file,i));
                                comboTreeResponseLinkedList.add(comboTreeResponse);
                            }

                        }


                    }
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        for(ComboTreeResponse res:comboTreeResponseLinkedList)
        {
            if(res.getChildren()!=null)
            {
                iconComboTreeResponseList.add(res);
            }
        }
        ComboTreeResponse comboTreeResponse=new ComboTreeResponse();
        comboTreeResponse.setId(i.get());
        comboTreeResponse.setState("closed");
        comboTreeResponse.setIconCls("icon-back");
        comboTreeResponse.setText("icon-back");
        List<ComboTreeResponse>  common= Lists.newLinkedList();
        for(ComboTreeResponse res:comboTreeResponseLinkedList)
        {
            if(res.getChildren()==null)
            {
                common.add(res);

            }
        }
        comboTreeResponse.setChildren(common);
        iconComboTreeResponseList.add(comboTreeResponse);

    }

    public static List<ComboTreeResponse> readIcon(File iconPath,AtomicInteger i) throws IOException {
        List<ComboTreeResponse>  myComboTreeList= Lists.newLinkedList();
        if(iconPath.exists()&&iconPath.isDirectory())
        {
            File[] files= iconPath.listFiles(new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                    if(name.endsWith(".png"))
                    {
                        return true;
                    }
                    return false;
                }
            });

                    if(files!=null&&files.length>0)
                    {
                        for(File file:files)
                        {


                            if(file.isDirectory())
                            {
                                ComboTreeResponse comboTreeResponse=new ComboTreeResponse();
                                comboTreeResponse.setId(i.get());
                                String iconCls="icon-"+file.getName().replace(".png","");
                                comboTreeResponse.setText(iconCls);
                                comboTreeResponse.setIconCls(iconCls);
                                i.incrementAndGet();
                                comboTreeResponse.setState("closed");
                                //如果是目录,进去遍历
                                comboTreeResponse.setChildren(readIcon(file,i));
                                myComboTreeList.add(comboTreeResponse);
                            }

                        }
                        for(File file:files) {

                            if(file.isFile())
                            {
                                ComboTreeResponse comboTreeResponse = new ComboTreeResponse();
                                comboTreeResponse.setId(i.get());
                                String iconCls = "icon-" + file.getName().replace(".png", "");
                                comboTreeResponse.setText(iconCls);
                                comboTreeResponse.setIconCls(iconCls);
                                i.incrementAndGet();

//                                System.out.println(String.format(cssFormatter,file.getName().replace(".png",""),"icons/"+iconPath.getName()+"/"+file.getName()));
                                comboTreeResponse.setState("open");
                                comboTreeResponse.setChildren(null);
                                myComboTreeList.add(comboTreeResponse);
                            }
                        }

                    }
            }
        return myComboTreeList;
    }

    public static   List<ComboTreeResponse> getIconComboTreeResponseList() {
        return iconComboTreeResponseList;
    }
}
