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

package com.moha.demo.eums;

public enum ViewString {
    id("序号"),
    userName("代理商名称"),
    money("账户余额")
    ;

    ViewString(String value) {
        this.value=value;
    }
    private String value;


    public String getValue() {
        return value;
    }
}
