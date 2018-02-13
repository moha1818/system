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

import com.moha.demo.dao.AsLogsMapper;
import com.moha.demo.entity.AsLogs;
import com.moha.demo.entity.AsUser;
import com.moha.demo.model.Page;
import com.moha.demo.service.AsLogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AsLogsServiceImpl implements AsLogsService {

    @Autowired
    private AsLogsMapper logsDao;
    @Override
    public void addLogs(String info, AsUser user) throws RuntimeException {
        //Map<String, Object> session = ActionContext.getContext().getSession();
        //AsUser user = (AsUser) request.getSession().getAttribute("user");
        AsLogs log=new AsLogs();
        log.setUserId(user.getId());
        log.setUserName(user.getUserName());
        log.setOperateInfo(info);
        logsDao.addlogs(log);
    }
    @Override
    public Page logs(int pageSize, int pageIndex) {
        Page p=new Page();
        p.setPageIndex(pageIndex);
        p.setPageSize(pageSize);
        p.setTotalCount(logsDao.logsline());
        p.setList(logsDao.logs(p.getLineNum(), pageSize));
        return p;
    }

    @Override
    public List<AsLogs> allLogs() {
        return logsDao.allLogs();
    }
}
