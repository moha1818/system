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

package com.moha.demo.service;

import com.moha.demo.entity.AsContacts;
import com.moha.demo.entity.AsCustoms;
import com.moha.demo.entity.AsUser;
import com.moha.demo.model.Page;

import java.util.List;

public interface AsCustomsService {
    // 客户添加
     void addCus(AsCustoms customs, List<AsContacts> contacts, AsUser user);

    // 客户分页显示
     Page getPage(int pageSize, int pageIndex, String name);

    // 客户添加显示
     AsCustoms findone(Integer id);

    // 客户修改
     void modifyCus(AsCustoms customs);

    //根据客户主键ID开启或关闭客户状态
     void state(Integer id,String status);

    //客户模糊查询
     List<AsCustoms> likeCus(String name);
}
