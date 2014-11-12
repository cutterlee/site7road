package com.sz.site7road.entity.config;

import com.google.common.base.Strings;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 9:58.
 * remark: 配置的类型
 */
public enum ConfigType {

    SYSTEM(1, "系统配置"),
    SERVICE(2, "业务配置");

    private int key;

    private String text;

    public int getKey() {
        return key;
    }

    public String getText() {
        return text;
    }

    private ConfigType(int key, String text) {
        this.key = key;
        this.text = text;
    }

    /**
     * 通过key得到配置种类的枚举
     *
     * @param key 配置的key
     * @return 配置的枚举
     */
    public static ConfigType getConfigType(int key) {
        if (key <= 0) {
            return null;
        }
        ConfigType configType = null;
        for (ConfigType config : ConfigType.values()) {
            if (key == config.getKey()) {
                configType = config;
                break;
            }
        }
        return configType;
    }

    /**
     * 通过key得到配置种类的枚举的重构方法
     * @param key 配置的key
     * @return 配置种类的枚举值
     */
    public static ConfigType getConfigType(String key) {
        if (Strings.isNullOrEmpty(key)) {
            return null;
        }
        try {
            int intKey = Integer.parseInt(key);
            return getConfigType(intKey);
        } catch (NumberFormatException ex) {
            return null;
        }
    }
}
