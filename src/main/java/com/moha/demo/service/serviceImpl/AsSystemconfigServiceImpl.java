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

import com.moha.demo.dao.AsSystemconfigMapper;
import com.moha.demo.entity.AsSystemconfig;
import com.moha.demo.model.Page;
import com.moha.demo.service.AsSystemconfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AsSystemconfigServiceImpl implements AsSystemconfigService {
    @Autowired
    public AsSystemconfigMapper systemconfigDao;

    @Override
    public List<AsSystemconfig> systemconfigs() {

        return systemconfigDao.systemconfigs();
    }

    @Override
    public List<AsSystemconfig> type(Integer configType, Integer isStart) {
        return systemconfigDao.type(configType, isStart);
    }
    @Override
    public void addSystemconfig(AsSystemconfig systemconfig) {
        systemconfigDao.addSystemconfig(systemconfig);
    }

    /*@Override
    public int findConfigTypeValue(Integer configType) {
        return systemconfigDao.findConfigTypeValue(configType);
    }*/
    @Override
    public Page getPage(int pageSize, int pageIndex, int configType) {
        Page p=new Page();
        p.setPageIndex(pageIndex);
        p.setPageSize(pageSize);
        p.setTotalCount(systemconfigDao.count(1));
        List<AsSystemconfig> list=systemconfigDao.pagefind(p.getLineNum(), pageSize, configType);
        p.setList(list);
        return p;
    }
    @Override
    public void delete(Integer id) {
        systemconfigDao.delete(id);
    }
    @Override
    public List<AsSystemconfig> getConfig(int configType) {
        List<AsSystemconfig> list = systemconfigDao.getConfig(configType);
        return list;
    }
    @Override
    public AsSystemconfig findsys(AsSystemconfig systemconfig) {
        return systemconfigDao.findsys(systemconfig);
    }
    @Override
    public  void update(AsSystemconfig systemconfig) {
        systemconfigDao.update(systemconfig);

    }
    @Override
    public AsSystemconfig findByID(Integer id) {
        return systemconfigDao.findByID(id);
    }
}
