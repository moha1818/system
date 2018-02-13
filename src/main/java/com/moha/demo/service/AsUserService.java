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

import com.moha.demo.entity.AsUser;
import com.moha.demo.model.BalanceView;

import java.util.List;

public interface AsUserService {
    // 分页查询所有用户
     List<AsUser> userlist(Integer pageIndex, Integer pageSize, String userName, Integer roleid, Integer isStart);

    // 模糊查询用户数量
     int num(String userName, Integer roleid, Integer isStart);

    // 增加用户
    // 增加用户as_account
     void addUser(AsUser user, Double money);

    //修改用户
     void modifyUser(AsUser user);

    // 删除用户
     void delUser(Integer id);

    // 根据用户姓名模糊查询 用户身份=2 用户是否启用=1，
     List<AsUser> findUsers(String name);

    // 查询用户
     AsUser user(int id);

    //登录
     AsUser login(String usercode,String password);

    //修改密码
     void pModify(int id,String newpwd);

    //修改上次登录时间
     void lastLogin(int id);

    //代理商余额报表
     List<BalanceView> balance();
}
