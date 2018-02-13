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
import com.moha.demo.dao.AsCustomsMapper;
import com.moha.demo.entity.AsContacts;
import com.moha.demo.entity.AsCustoms;
import com.moha.demo.entity.AsUser;
import com.moha.demo.model.Page;
import com.moha.demo.service.AsCustomsService;
import com.moha.demo.service.AsLogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AsCustomsServiceImpl implements AsCustomsService {
    @Autowired
    private AsCustomsMapper customsDao;
    @Autowired
    private AsLogsService logsService;
    @Autowired
    private AsContactsMapper contactsServiceImpl;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void addCus(AsCustoms customs, List<AsContacts> contacts, AsUser user) throws RuntimeException {
        customsDao.addCus(customs);
        if(contacts!=null) {
            for (AsContacts con : contacts) {
                con.setCustomId(customs.getId());// 最近的customId
                contactsServiceImpl.addContacts(con);
            }
            // 添加日志
            String info = "用户添加客户信息操作";
            logsService.addLogs(info,user);
        }
    }

    @Override
    public Page getPage(int pageSize, int pageIndex, String name) {
        Page p=new Page();
        p.setPageIndex(pageIndex);
        p.setPageSize(pageSize);
        String cusName;
        if(name!=null){
            cusName="%"+name+"%";
        }else{
            cusName=name;
        }
        p.setTotalCount(customsDao.count(cusName));
        p.setTotal(customsDao.count(cusName));
        p.setList(customsDao.likefind(p.getLineNum(), pageSize, cusName));
        return p;
    }

    @Override
    public AsCustoms findone(Integer id) {
        return customsDao.findone(id);
    }

    @Override
    public void modifyCus(AsCustoms customs) throws RuntimeException {
        customsDao.modifyCus(customs);
    }

    @Override
    public void state(Integer id, String status) throws RuntimeException {
        int customStatus;
        if(status.trim().equals("启用")){
            customStatus=1;
        }else{
            customStatus=0;
        }
        customsDao.state(id, customStatus);
    }

    @Override
    public List<AsCustoms> likeCus(String name)  {
        String cusName;
        if(name!=null){
            cusName="%"+name+"%";
        }else{
            cusName=name;
        }
        return customsDao.likeCus(cusName);
    }

}
