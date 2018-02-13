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

import com.moha.demo.dao.AsKeywordsMapper;
import com.moha.demo.entity.AsKeywords;
import com.moha.demo.model.Page;
import com.moha.demo.model.ProductCount;
import com.moha.demo.service.AsKeywordsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AsKeywordsServiceImpl implements AsKeywordsService {

    @Autowired
    private AsKeywordsMapper keywordsDao;

    @Override
    public List<AsKeywords> getportal(int id, int pageIndex, int pageSize, String keywordName, String customName) {
        Page p=new Page();
        p.setPageIndex(pageIndex);
        p.setPageSize(pageSize);
        if(keywordName==null||keywordName.equals("")){
            keywordName = null;
        }else{
            keywordName = "%"+keywordName+"%";
        }
        if(customName==null||customName.equals("")){
            customName = null;
        }else{
            customName = "%"+customName+"%";
        }
        List<AsKeywords> list = keywordsDao.getportal(id, p.getLineNum(), pageSize, keywordName, customName);
        return list;
    }

    @Override
    public int getCount(int id, String keywordName, String customName) {

        if(keywordName==null||keywordName.equals("")){
            keywordName = null;
        }else{
            keywordName = "%"+keywordName+"%";
        }
        if(customName==null||customName.equals("")){
            customName = null;
        }else{
            customName = "%"+customName+"%";
        }
        int total = keywordsDao.getCount(id, keywordName, customName);
        return total;
    }

    @Override
    public AsKeywords portalView(int id) {

        AsKeywords keywords = keywordsDao.portalView(id);
        return keywords;
    }

    @Override
    public void portalUpdate(String appUserName, String appPassword, String iosDownloadUrl, String codeIosUrl,
                             String androidDownloadUrl, String codeAndroidUrl, int kid) {

        keywordsDao.portalUpdate(appUserName, appPassword, iosDownloadUrl, codeIosUrl, androidDownloadUrl, codeAndroidUrl, kid);

    }

    @Override
    public int keyCount(String keywords) {
        return keywordsDao.keyCount(keywords);
    }

    @Override
    public void addKeyWord(AsKeywords keywords) throws RuntimeException{
        keywordsDao.addKeyWord(keywords);
    }

    @Override
    public List<AsKeywords> getKeywords(int pageIndex, int pageSize, String keywordName) {
        if(keywordName==null||keywordName.equals("")){
            keywordName = null;
        }else{
            keywordName = "%"+keywordName+"%";
        }
        Page p=new Page();
        p.setPageIndex(pageIndex);
        p.setPageSize(pageSize);
        List<AsKeywords> list = keywordsDao.getKeywords(p.getLineNum(), pageSize, keywordName);
        return list;
    }

    @Override
    public int keywordsCount(String keywordName) {
        if(keywordName==null||keywordName.equals("")){
            keywordName = null;
        }else{
            keywordName = "%"+keywordName+"%";
        }
        int total = keywordsDao.keywordsCount(keywordName);
        return total;
    }

    @Override
    public AsKeywords showKey(String keyname) {
        AsKeywords key = keywordsDao.showKey(keyname);
        return key;
    }

    @Override
    public void openApp(String appPassword, String appUserName,int kid) {
        keywordsDao.openApp(appPassword, appUserName,kid);

    }

    @Override
    public void renew(int kid, int years) {
        keywordsDao.renew(years, kid);
    }

    @Override
    public void updateStatus(int status, String keyname) {
        keywordsDao.updateStatus(status, keyname);

    }

    @Override
    public void updateUse(int isUse, String keyname) {
        keywordsDao.updateUse(isUse, keyname);

    }

    @Override
    public List<AsKeywords> allkeywords() {
        return keywordsDao.allkeys();
    }

    @Override
    public List<ProductCount> getCount() {

        List<ProductCount> list = keywordsDao.getCountType();
        return list;
    }


}
