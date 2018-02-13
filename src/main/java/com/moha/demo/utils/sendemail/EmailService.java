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

package com.moha.demo.utils.sendemail;

import java.util.Map;

public interface EmailService {
    void sendEmail(Map<String, Object> contentMap, String TemplateNameOrContent, String targetEmail, String subject);
    void sendEmail(String TemplateNameOrContent, String targetEmail, String subject);
}
