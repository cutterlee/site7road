package com.sz.site7road.util;

import com.google.common.base.Charsets;
import freemarker.template.*;

import java.io.*;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/5 15:24.
 * remark:模板工具类
 */
public final class FtlUtil {

    public static final String ENCODING = Charsets.UTF_8.displayName();
    private static Configuration configuration = new Configuration();
    private static FtlUtil instance=new FtlUtil();
    private static ResourceBundle message = ResourceBundle.getBundle("message");


    public static void setMessage(ResourceBundle message) {
        FtlUtil.message = message;
    }

    public static boolean init() throws TemplateModelException, IOException {

        //2,setSharedVariable

        Set<String> keySet = message.keySet();
        if (!keySet.isEmpty()) {
            for (String key : keySet) {
                configuration.setSharedVariable(key, message.getString(key));
            }
        }
        //3,setSettings
        File currentFile = new File(FtlUtil.class.getResource("/").getPath());

        String templateFilePath=currentFile.getParent()+"/site7road/WEB-INF/page/";

        configuration.setDirectoryForTemplateLoading(new File(templateFilePath));//set directory for ftl




        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
        //setDefaultEncoding
        configuration.setDefaultEncoding(ENCODING);
        configuration.setObjectWrapper(new DefaultObjectWrapper());
        return false;
    }

    public static FtlUtil getInstance(){
        if(null==instance)
        {
            instance=new FtlUtil();
        }
        return instance;
    }

     private FtlUtil(){
        try {
            init();
        } catch (TemplateModelException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成html文件
     *
     * @param ftlFile 模板文件
     * @param data    封装的数据
     * @param file    html文件
     * @throws IOException
     * @throws TemplateException
     */
    public void createHTML(String ftlFile, Map data, String file)
            throws IOException, TemplateException {
        Writer out = null;
        FileOutputStream output = null;
        try {
            Template template = configuration.getTemplate(ftlFile);
            String htmlSavePath= message.getString("html.save.path");
            output = new FileOutputStream(htmlSavePath+file+".html");
            out = new OutputStreamWriter(output, ENCODING);
            template.process(data, out);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            // 关闭out output
            if (out != null) {
                out.flush();
                out.close();
            }
            if (output != null) {
                output.flush();
                output.close();
            }
        }
    }

    /**
     * 输出到字符串
     *
     * @param ftlFile 模板文件(相对根目录的绝对路径，以/开头)
     * @param data    数据Map
     * @return 结果字符串
     */
    public String getString(String ftlFile, Map data) {
        StringWriter writer = null;
        String result = "";
        try {
            Template template = configuration.getTemplate(ftlFile);
            template.setEncoding(ENCODING);
            writer = new StringWriter();
            template.process(data, writer);
            result = writer.toString();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭write
            try {
                if (writer != null) {
                    writer.flush();
                    writer.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 输出到内存
     *
     * @param ftlFile 模板文件(相对模板文件目录的相对路径)
     * @param data    数据Map
     * @return ByteArrayOutputStream
     * @throws IOException
     */
    public ByteArrayOutputStream createByteArray(String ftlFile, Map data)
            throws IOException {
        ByteArrayOutputStream os = null;
        BufferedWriter writer = null;
        try {
            Template template = configuration.getTemplate(ftlFile);
            template.setEncoding(ENCODING);
            os = new ByteArrayOutputStream();
            writer = new BufferedWriter(new OutputStreamWriter(os));
            template.process(data, writer);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭os write
            if (writer != null) {
                writer.flush();
                writer.close();
            }
            if (os != null) {
                os.flush();
                os.close();
            }
        }
        return os;
    }

}
