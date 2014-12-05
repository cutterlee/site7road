package com.sz.site7road.util;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.primitives.Ints;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;

import java.lang.reflect.InvocationTargetException;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/3 10:59.
 * remark:获得实体属性的帮助类
 */
public final class BeanHelpUtil {

    /**
     * 获得对象的某个属性的值
     * @param entity 对象
     * @param propertyName 属性名称
     * @return
     */
    public static Object getProperty(Object entity,String propertyName){
        Preconditions.checkArgument(!Strings.isNullOrEmpty(propertyName));
        try {
            return PropertyUtils.getProperty(entity, propertyName);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
//            e.printStackTrace();
        }
        return null;
    }


    /**
     * 获取对象的某个属性的字符串值
     * @param entity 对象
     * @param propertyName 属性值
     * @return
     */
    public static String getStringProperty(Object entity,String propertyName)
    {
        Object value=getProperty(entity,propertyName);
        if(null!=value)
        {
            return value.toString();
        }
        return null;
    }

    /**
     * 获取对象的某个属性的整数值
     * @param entity 对象
     * @param propertyName 属性值
     * @return
     */
    public static int getIntProperty(Object entity,String propertyName)
    {
        String value=getStringProperty(entity,propertyName);
        if(!Strings.isNullOrEmpty(value))
        {
            return Ints.tryParse(value);
        }
        return 0;
    }

    /**
     * 判断某个对象是不是含有某个属性名
     * @param emptyEntity 对象
     * @param propertyName 属性
     * @return  是否含有属性
     */
    public static boolean containsProperty(Object emptyEntity, String propertyName) {
        if(null==getProperty(emptyEntity,propertyName))
        {
            return false;
        }
        return true;
    }
}
