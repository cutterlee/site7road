package com.sz.site7road.util;

import com.google.common.base.Charsets;
import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.codec.Hex;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/2 10:10.
 * remark:提供一套可逆的加密解密算法
 */
public final class PasswordUtil {

    /**
     * 通过明文,加密得到密文
     * @param clearTxt 明文
     * @return 密文
     */
    public static String  encrypt(String clearTxt){
        Preconditions.checkArgument(!Strings.isNullOrEmpty(clearTxt),"明文不能为空");
        byte[] bytes = Hex.encodeToString(clearTxt.getBytes(Charsets.UTF_8)).getBytes(Charsets.UTF_8);
        byte[] base64EncodeBytes= Base64.encode(bytes);
        return Hex.encodeToString(base64EncodeBytes);
    }

    /**
     * 通过密文,得到明文
     * @param cipherTxt 密文
     * @return 明文
     */
    public static  String decrypt(String cipherTxt){
        Preconditions.checkArgument(!Strings.isNullOrEmpty(cipherTxt),"密文不能为空");
        byte[] bytes = Hex.decode(cipherTxt);
        byte[] base64EncodeBytes= Base64.decode(bytes);
        return  new String(Hex.decode(base64EncodeBytes),Charsets.UTF_8);
    }

    public static void main(String[] args){
        String clearTxt="jdbc:mysql://10.10.4.12:2433/db_site_7road?useUnicode=true&characterEncoding=UTF-8";
        test(clearTxt);
        test("root");
        test("love7road");
    }

    private static void test(String clearTxt) {
        String cipherTxt=encrypt(clearTxt);
        System.out.println("密文:"+cipherTxt);
        String clearTxt2=decrypt(cipherTxt);
        System.out.println("明文:"+clearTxt2);
    }

}
