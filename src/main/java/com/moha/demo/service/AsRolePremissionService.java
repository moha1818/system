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

import com.moha.demo.entity.AsRolePremission;
import com.moha.demo.entity.AsUser;

import java.util.List;

public interface AsRolePremissionService {
    //增加权限
     void addPremission(AsRolePremission role_premission );

    //删除权限
     void delPremission(Integer roleId);

    //查询单个角色的权限功能ID集合
     List<Integer> role_premissions(Integer roleId);

    //更新权限
    void updatePremission(Integer roleid, List<Integer> permission, AsUser user);

    //查找该角色的function
     boolean authorization(Integer roleId,String functionCode);   
}
