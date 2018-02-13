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

import java.util.List;

public interface AsContactsService {
    // 添加联系人
     void addContacts(AsContacts contacts);

    // 修改客户 ：查相关联系人
     List<AsContacts> findList(Integer id);

    // 修改联系人
     void modifyContacts(AsContacts contacts);

    // 根据主键ID删除联系人
     void deleteContact(Integer id);
}
