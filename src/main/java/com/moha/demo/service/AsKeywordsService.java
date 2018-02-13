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

import com.moha.demo.entity.AsKeywords;
import com.moha.demo.model.ProductCount;

import java.util.List;

public interface AsKeywordsService {
    //门户管理模糊查询分页显示
     List<AsKeywords> getportal(int id, int pageIndex, int pageSize, String keywordName, String customName);
    //查询总记录数
     int getCount(int id,String keywords,String customName);

    //查看门户
     AsKeywords portalView(int id);

    //修改门户
     void portalUpdate(String appUserName,String appPassword,String iosDownloadUrl,
                             String codeIosUrl,String androidDownloadUrl,String codeAndroidUrl,int kid);

    //查询是否存在关键词
     int keyCount(String keywords);
    //添加关键词
     void addKeyWord(AsKeywords keywords);

    //获取关键词表
     List<AsKeywords> getKeywords(int pageIndex,int pageSize,String keywordName);
    //总记录数
     int keywordsCount(String keywordName);

    //根据keyname获取关键词信息
     AsKeywords showKey(String keyname);

    //开通app
     void openApp(String appPassword,String appUserName,int kid);

    //关键词续费
     void renew(int kid,int years);

    //修改审核状态
     void updateStatus(int status,String keyname);

    //修改使用状态
     void updateUse(int isUse,String keyname);

    List<AsKeywords> allkeywords();

    //产品分类数量/金额汇总
     List<ProductCount> getCount();
}
