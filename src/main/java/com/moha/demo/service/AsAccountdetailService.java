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

import com.moha.demo.entity.AsAccountdetail;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface AsAccountdetailService {
    // 根据用户id得到账户详细表并分页
     List<AsAccountdetail> showDetail(int id, int pageIndex, int pageSize, int detailType, Date starttime,
                                            Date endtime);

    // 得到总记录数
     int detailCount(@Param("id") int id, int detailType, Date starttime, Date endtime);

    // 预付款流水报表
     List<AsAccountdetail> preRunning(Date starttime, Date endtime);

    // 代理商流水报表
     List<AsAccountdetail> agentRunning(Date starttime, Date endtime);

    //事务:冻结 ，扣款，返款等账务操作
    //account表金额修改
     void freezeMoney(AsAccountdetail accountdetail);

    //事务：转账
    //account表金额修改
    //accountdetail表增加
     int financial(String money,Integer userId,Integer id,Integer detailType,String detailTypeName,String memo);
}
