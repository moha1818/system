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

import com.moha.demo.dao.HatAreaMapper;
import com.moha.demo.entity.HatArea;
import com.moha.demo.service.HatAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HatAreaServiceImpl implements HatAreaService {
    @Autowired
    private HatAreaMapper hatAreaMapper;

    @Override
    public List<HatArea> areas(String cityID) {
        return hatAreaMapper.areas(cityID);
    }
}
