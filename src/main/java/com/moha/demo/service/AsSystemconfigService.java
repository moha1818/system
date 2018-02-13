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

import com.moha.demo.entity.AsSystemconfig;
import com.moha.demo.model.Page;

import java.util.List;

public interface AsSystemconfigService {
    // 查询财务类型
     List<AsSystemconfig> systemconfigs();

    //类型查找
     List<AsSystemconfig> type(Integer configType,Integer isStart);

    // 增加系统配置
     void addSystemconfig(AsSystemconfig systemconfig);

	/*// 寻找configTypeValue
	 int findConfigTypeValue(Integer configType);*/

    //分页显示系统配置
     Page getPage(int pageSize, int pageIndex, int configType);

    //删除系统配置
     void delete(Integer id);

    //根据 configType查询类集合
     List<AsSystemconfig> getConfig(int configType);

    //动态查询
     AsSystemconfig findsys(AsSystemconfig systemconfig);

    //更新配置
     void update(AsSystemconfig systemconfig);

    // 根据ID查询配置
     AsSystemconfig findByID(Integer id);
}
