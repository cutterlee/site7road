package com.sz.site7road.framework.security;

import com.sz.site7road.util.PasswordUtil;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.util.Properties;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/2 11:48.
 * remark:对属性文件的解密
 */
public class PropertyCipher extends PropertyPlaceholderConfigurer{

    String[] cipherProperties={"jdbc.url","jdbc.username","jdbc.password"};
    @Override
    protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess, Properties props) throws BeansException {
        //对属性文件的某些敏感信息进行解密,非敏感的配置信息直接进行加载
        for(String cipherProperty:cipherProperties)
        {
            if(props.containsKey(cipherProperty))
            {
                String decrypt = PasswordUtil.decrypt(props.getProperty(cipherProperty));
                props.setProperty(cipherProperty, decrypt);
            }
        }

        super.processProperties(beanFactoryToProcess, props);
    }
}
