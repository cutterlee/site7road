package com.sz.site7road.util;

import javax.servlet.http.HttpServletRequest;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/12 17:07.
 * remark:web的常用实用方法
 */
public class HttpUtil {

    /**
     * 获取登录ip
     * @param request 请求对象
     * @return 请求的客户端ip
     */
    public  static  String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
