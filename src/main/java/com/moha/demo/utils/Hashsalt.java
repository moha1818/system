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

package com.moha.demo.utils;

import com.moha.demo.entity.AsUser;
import org.apache.commons.lang3.StringUtils;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.UUID;

public class Hashsalt {
    public boolean equals(String password,AsUser user) {
        String encryptPassword = encrypt(password + user.getSalt());
        if (encryptPassword.compareTo(user.getUserPassword()) == 0) {
            return true;
        }

        return false;
    }
    //加”盐“
    public  AsUser saveTo(String password) {
        UUID uuid = UUID.randomUUID();
        String salt = uuid.toString().replace("-", "");
        String hashPassword = encrypt(password + salt);
        AsUser u=new AsUser();
        u.setSalt(salt);
        u.setUserPassword(hashPassword);
        return u;
    }

    //加密
    public String encrypt(String password) {
        String algorithm = EnvUtils.getProperty("algorithm");
        String keyString =  EnvUtils.getProperty("keyString");
        SecretKey key = new SecretKeySpec(keyString.getBytes(), algorithm);

        try {
            Mac m = Mac.getInstance(algorithm);
            m.init(key);
            m.update(password.getBytes());
            byte[] mac = m.doFinal();
            return toHexString(mac);
        }
        catch (Exception e) {
            System.out.println(e.toString());
        }

        return StringUtils.EMPTY;
    }

    //byte[] -> string
    private String toHexString(byte[] in) {
        StringBuilder hexString = new StringBuilder();
        for (int i = 0; i < in.length; i++){
            //位运算
            int temp=0xFF & in[i];
            //int->16进制的字符串格式
            String hex = Integer.toHexString(temp);
            if (hex.length() == 1){
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

}
