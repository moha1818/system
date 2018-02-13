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

import com.moha.demo.entity.AsLogs;
import com.moha.demo.entity.AsUser;
import com.moha.demo.model.Page;

import java.util.List;

public interface AsLogsService {
    //添加日志操作
     void addLogs(String info, AsUser user);
    //分页显示日志
     Page logs(int pageSize, int pageIndex );

    List<AsLogs> allLogs();
}
