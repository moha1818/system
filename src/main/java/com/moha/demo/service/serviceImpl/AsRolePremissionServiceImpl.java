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

import com.moha.demo.dao.AsFunctionMapper;
import com.moha.demo.dao.AsRolePremissionMapper;
import com.moha.demo.entity.AsRolePremission;
import com.moha.demo.entity.AsUser;
import com.moha.demo.service.AsRolePremissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class AsRolePremissionServiceImpl implements AsRolePremissionService {
    @Autowired
    private AsRolePremissionMapper asRolePremissionMapper;
    @Autowired
    private AsFunctionMapper asFunctionMapper;

    @Override
    public void addPremission(AsRolePremission role_premission) {
        asRolePremissionMapper.addPremission(role_premission);

    }

    @Override
    public void delPremission(Integer roleId) {
        asRolePremissionMapper.delPremission(roleId);

    }

    @Override
    public List<Integer> role_premissions(Integer roleId) {

        return asRolePremissionMapper.role_premissions(roleId);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void updatePremission(Integer roleid, List<Integer> permission, AsUser user) {
        AsRolePremission role_premission =new AsRolePremission();
        this.delPremission(roleid);
        for(Integer tmp:permission){
            role_premission.setRoleId(roleid);
            role_premission.setFunctionId(tmp);
            role_premission.setCreationTime(new Date());
            role_premission.setCreatedBy(user.getUserCode());
            role_premission.setLastUpdatetime(new Date());
            role_premission.setIsStart(1);
            this.addPremission(role_premission);
        }
    }

    @Override
    public boolean authorization(Integer roleId, String functionCode) {
        return (asFunctionMapper.authorization(roleId, functionCode)==0)? false: true;
    }
}
