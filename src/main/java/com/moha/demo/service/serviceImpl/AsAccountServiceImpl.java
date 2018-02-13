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

import com.moha.demo.dao.AsAccountMapper;
import com.moha.demo.entity.AsAccount;
import com.moha.demo.service.AsAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AsAccountServiceImpl implements AsAccountService {
    @Autowired
    private AsAccountMapper accountDao;

    @Override
    public AsAccount getAccount(int id) {
        AsAccount account = accountDao.getAccount(id);
        return account;
    }

    @Override
    public void modifyAccount(int userid, Double money) throws RuntimeException {
        accountDao.modifyAccount(userid, money);

    }
}
