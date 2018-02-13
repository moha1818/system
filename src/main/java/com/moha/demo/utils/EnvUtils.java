/*
 * 版权所有(C) 浙江大道网络科技有限公司2011-2020
 * Copyright 2009-2020 Zhejiang GreatTao Factoring Co., Ltd.
 *
 * This software is the confidential and proprietary information of
 * Zhejiang GreatTao Corporation ("Confidential Information").  You
 * shall not disclose such Confidential Information and shall use
 * it only in accordance with the terms of the license agreement
 * you entered into with Zhejiang GreatTao
 */

package com.moha.demo.utils;

import org.springframework.core.io.support.PropertiesLoaderSupport;

import java.io.IOException;
import java.util.Properties;

public class EnvUtils extends PropertiesLoaderSupport {
    private static Properties properties;

    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
    public void init() throws IOException {
        try {
            if(properties == null){//第一次
                properties = super.mergeProperties();
            } else {//多次合并
                properties.putAll(super.mergeProperties());
            }
        } catch (IOException e) {
            throw new IOException("load properties error");
        }
    }
}
