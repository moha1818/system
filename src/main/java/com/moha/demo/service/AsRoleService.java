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

import com.moha.demo.entity.AsRole;

import java.util.List;

public interface AsRoleService {
    // 查询角色
     List<AsRole> list();

    // 增加角色
     void addRole(AsRole role);

    // 修改角色
     void modifyRole(AsRole role);

    // 删除角色
     void delRole(Integer id);

    //查询单个角色
     AsRole selectRole(Integer id);
}
