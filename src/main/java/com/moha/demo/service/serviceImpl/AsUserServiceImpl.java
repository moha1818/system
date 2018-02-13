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

import com.moha.demo.dao.AsAccountMapper;
import com.moha.demo.dao.AsUserMapper;
import com.moha.demo.entity.AsUser;
import com.moha.demo.model.BalanceView;
import com.moha.demo.model.Page;
import com.moha.demo.service.AsUserService;
import com.moha.demo.utils.Hashsalt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AsUserServiceImpl implements AsUserService {
    @Autowired
    private AsUserMapper userDao;
    @Autowired
    private AsAccountMapper accountDao;

    @Override
    public List<AsUser> userlist(Integer pageIndex, Integer pageSize, String userName, Integer roleid, Integer isStart) {
        if(userName==null){
            userName=null;
        }else{
            userName="%"+userName+"%";
        }
        Page p=new Page();
        p.setPageIndex(pageIndex);
        p.setPageSize(pageSize);
        return userDao.userlist(p.getLineNum(),pageSize,userName,roleid,isStart);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void addUser(AsUser user,Double money) throws RuntimeException {
        Hashsalt hashsalt=new Hashsalt();
        AsUser password_salt=new AsUser();
        password_salt=hashsalt.saveTo(user.getUserPassword());
        user.setSalt(password_salt.getSalt());
        user.setUserPassword(password_salt.getUserPassword());
        userDao.addUser(user);
        accountDao.addAccount(user.getId(), money);
    }


    @Override
    public int num(String userName, Integer roleid, Integer isStart) {
        if(userName==null){
            userName=null;
        }else{
            userName="%"+userName+"%";
        }
        return userDao.num(userName, roleid, isStart);
    }

    @Override
    public void delUser(Integer id) {
        userDao.delUser(id);

    }

    @Override
    public List<AsUser> findUsers(String name) {
        String cusName;
        if(name!=null){
            cusName="%"+name+"%";
        }else{
            cusName=name;
        }
        return userDao.findUsers(cusName, 2, 1);
    }

    @Override
    public AsUser user(int id) {

        return userDao.user(id);
    }

    @Override
    public void modifyUser(AsUser user) {
        Hashsalt hashsalt=new Hashsalt();
        AsUser password_salt=new AsUser();
        password_salt=hashsalt.saveTo(user.getUserPassword());
        user.setSalt(password_salt.getSalt());
        user.setUserPassword(password_salt.getUserPassword());
        userDao.modifyUser(user);
    }
    @Override
    public AsUser login(String usercode, String password) {
        AsUser user =userDao.selectUserByusercode(usercode);
        Hashsalt hashsalt=new Hashsalt();
        if(hashsalt.equals(password,user))
            return user;
        else
            return null;
    }

    @Override
    public void pModify(int id,String newpwd) {
        Hashsalt hashsalt=new Hashsalt();
        AsUser user=hashsalt.saveTo(newpwd);
        userDao.pModify(id, user.getUserPassword(),user.getSalt());
    }

    @Override
    public void lastLogin( int id) {

        userDao.lastLogin(id);
    }

    @Override
    public List<BalanceView> balance() {

        List<BalanceView> list = userDao.balance();
        return list;
    }


}
