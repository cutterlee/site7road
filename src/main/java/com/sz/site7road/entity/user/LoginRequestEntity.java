package com.sz.site7road.entity.user;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import java.util.Map;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/14 9:56.
 * remark:登陆的请求数据
 */
public class LoginRequestEntity {

    /**
     * 用户名
     */
    @NotBlank
    @Length(min=8,max = 20)
    private String username;

    /**
     * 密码
     */
    @NotBlank
    @Length(max = 20,min=8)
    private String password;

    /**
     * 验证码
     */
    @NotBlank
    @Length(max=4)
    private String  verifyCode;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

   private static Map<String,String> fieldMap= Maps.newHashMap();

    public LoginRequestEntity() {
        fieldMap.put("username","用户名");
        fieldMap.put("password","密码");
        fieldMap.put("verifyCode","验证码");
    }

    public static String getFiledName(String field){
        if(fieldMap.isEmpty())
        {
            fieldMap.put("username","用户名");
            fieldMap.put("password","密码");
            fieldMap.put("verifyCode","验证码");
        }
        if(Strings.isNullOrEmpty(field))
        {
            return null;
        }
        return fieldMap.get(field);
    }

}
