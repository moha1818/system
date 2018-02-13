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

import com.moha.demo.entity.HatProvince;

import java.util.List;

public interface HatProvinceService {
    // 省查询
    List<HatProvince> provinces();

    // 省查询根据provinceId查询省
    HatProvince pro(String provinceId);
}
