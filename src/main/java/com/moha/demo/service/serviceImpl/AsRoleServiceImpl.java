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

import com.moha.demo.dao.AsRoleMapper;
import com.moha.demo.entity.AsRole;
import com.moha.demo.service.AsRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AsRoleServiceImpl implements AsRoleService {
    @Autowired
    private AsRoleMapper asRoleMapper;

    //查询所有角色
    @Override
    public List<AsRole> list() {
        List<AsRole> list=asRoleMapper.list();
        System.out.println("service被执行");
        return list;
    }

    //增加角色
    @Override
    public void addRole(AsRole role) {
        asRoleMapper.addRole(role);

    }

    //修改角色
    @Override
    public void modifyRole(AsRole role) {
        asRoleMapper.modifyRole(role);

    }

    //删除角色
    @Override
    public void delRole(Integer id) {
        asRoleMapper.delRole(id);

    }
    //单个角色
    @Override
    public AsRole selectRole(Integer id) {

        return asRoleMapper.selectRole(id);
    }
}
