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

import com.moha.demo.dao.AsAccountdetailMapper;
import com.moha.demo.entity.AsAccountdetail;
import com.moha.demo.model.Page;
import com.moha.demo.service.AsAccountService;
import com.moha.demo.service.AsAccountdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class AsAccountdetailServiceImpl implements AsAccountdetailService {
    @Autowired
    private AsAccountdetailMapper accountdetailDao;
    @Autowired
    private AsAccountService accountServiceImpl;

    @Override
    public List<AsAccountdetail> showDetail(int id, int pageIndex, int pageSize, int detailType, Date starttime,
                                            Date endtime) {
        Page p=new Page();
        p.setPageIndex(pageIndex);
        p.setPageSize(pageSize);
        List<AsAccountdetail> list = accountdetailDao.showDetail(id, p.getLineNum(), pageSize, detailType, starttime, endtime);
        return list;
    }

    @Override
    public int detailCount(int id, int detailType, Date starttime, Date endtime) {
        int total = accountdetailDao.detailCount(id, detailType, starttime, endtime);
        return total;
    }

    @Override
    public List<AsAccountdetail> preRunning(Date starttime, Date endtime) {

        List<AsAccountdetail> list = accountdetailDao.preRunning(starttime, endtime);
        return list;
    }

    @Override
    public List<AsAccountdetail> agentRunning(Date starttime, Date endtime) {

        List<AsAccountdetail> list = accountdetailDao.agentRunning(starttime, endtime);
        return list;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void freezeMoney(AsAccountdetail accountdetail) throws RuntimeException {
        accountdetailDao.addDetail(accountdetail);
        accountServiceImpl.modifyAccount(accountdetail.getUserId(), accountdetail.getAccountMoney());
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public int financial(String money, Integer userId, Integer id, Integer detailType, String detailTypeName,String memo) throws RuntimeException {
        String n1=money.trim().substring(0, 1);
        String n_last=money.trim().substring(1, money.length());
        Double tempMoney1=accountServiceImpl.getAccount(userId).getMoney();
        Double tempMoney2=accountServiceImpl.getAccount(id).getMoney();
        if(n1.equals("-")){
            if(tempMoney1>Double.parseDouble(n_last)){
                //userId
                tempMoney1=tempMoney1-Double.parseDouble(n_last);
                accountServiceImpl.modifyAccount(userId, tempMoney1);
                //id
                tempMoney2=tempMoney2+Double.parseDouble(n_last);
                accountServiceImpl.modifyAccount(id, tempMoney2);

                AsAccountdetail accountdetail=new AsAccountdetail();
                accountdetail.setAccountMoney(tempMoney1);
                accountdetail.setDetailType(detailType);
                accountdetail.setDetailTypeName(detailTypeName);
                accountdetail.setUserId(userId);
                accountdetail.setMoney(Double.parseDouble(n_last));
                accountdetail.setMemo(memo);
                accountdetailDao.addDetail(accountdetail);
                return 0;
            }else{
                return 1;
            }
        }else{
            if(tempMoney2>Double.parseDouble(money)){
                //userId
                tempMoney1=tempMoney1+Double.parseDouble(n_last);
                accountServiceImpl.modifyAccount(userId, tempMoney1);
                //id
                tempMoney2=tempMoney2-Double.parseDouble(n_last);
                accountServiceImpl.modifyAccount(id, tempMoney2);

                AsAccountdetail accountdetail=new AsAccountdetail();
                accountdetail.setAccountMoney(tempMoney1);
                accountdetail.setDetailType(detailType);
                accountdetail.setDetailTypeName(detailTypeName);
                accountdetail.setUserId(userId);
                accountdetail.setMoney(Double.parseDouble(n_last));
                accountdetail.setMemo(memo);
                accountdetailDao.addDetail(accountdetail);
                return 0;
            }else{
                return 2;
            }
        }
    }
}
