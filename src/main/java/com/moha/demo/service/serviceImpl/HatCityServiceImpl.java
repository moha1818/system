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

import com.moha.demo.dao.HatCityMapper;
import com.moha.demo.entity.HatCity;
import com.moha.demo.service.HatCityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HatCityServiceImpl implements HatCityService {
    @Autowired
    private HatCityMapper hatCityMapper;

    @Override
    public List<HatCity> citys(String provinceId) {
        return hatCityMapper.citys(provinceId);
    }
}
