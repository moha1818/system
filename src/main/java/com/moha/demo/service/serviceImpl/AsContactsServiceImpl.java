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

package com.moha.demo.service.serviceImpl;

import com.moha.demo.dao.AsContactsMapper;
import com.moha.demo.entity.AsContacts;
import com.moha.demo.service.AsContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AsContactsServiceImpl implements AsContactsService {
    @Autowired
    private AsContactsMapper contactsDaoImpl;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void addContacts(AsContacts contacts) throws RuntimeException{
        contactsDaoImpl.addContacts(contacts);
    }

    @Override
    public List<AsContacts> findList(Integer id) {
        return contactsDaoImpl.findList(id);
    }

    @Override
    public void deleteContact(Integer id) throws RuntimeException {
        contactsDaoImpl.deleteContact(id);
    }

    @Override
    public void modifyContacts(AsContacts contacts) throws RuntimeException {
        contactsDaoImpl.modifyContacts(contacts);

    }
}
