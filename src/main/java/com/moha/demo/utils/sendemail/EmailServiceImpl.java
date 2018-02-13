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

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.velocity.VelocityConfigurer;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.StringWriter;
import java.util.Map;

@Service(value = "emailServiceImpl")
public class EmailServiceImpl implements EmailService {
    @Resource(name = "mailSender")
    JavaMailSenderImpl mailSender;


    @Resource(name = "velocityConfig")
    VelocityConfigurer velocityConfig;

    @Resource
    TaskExecutor taskExecutor;

    @Override
    public void sendEmail(Map<String, Object> contentMap, String TemplateNameOrContent, String targetEmail, String subject) {

        VelocityContext context = new VelocityContext();
        if (null != contentMap) {
            context = new VelocityContext(contentMap);
        }
        String content = "";

        try {
            final MimeMessage mailMessage = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage, true, "utf-8");
            messageHelper.setTo(targetEmail);
            messageHelper.setSubject(subject);
            messageHelper.setFrom(mailSender.getUsername());
            try {
                content = this.getContentByVelocity(velocityConfig.getVelocityEngine().getTemplate(TemplateNameOrContent, "UTF-8"), context);
            } catch (ResourceNotFoundException e) {
                content = TemplateNameOrContent;
            } catch (Exception e) {
                e.printStackTrace();
            }
            messageHelper.setText(content, true);

            taskExecutor.execute(new Runnable() {
                public void run() {
                    try {
                        mailSender.send(mailMessage);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            });
        } catch (MessagingException e1) {
            e1.printStackTrace();
        }

    }
    public static String getContentByVelocity(Template template, VelocityContext context) throws Exception {
        StringWriter sw = new StringWriter();
        template.merge(context, sw);
        sw.flush();
        return sw.toString();
    }

    @Override
    public void sendEmail(String TemplateNameOrContent, String targetEmail, String subject) {
        this.sendEmail(null, TemplateNameOrContent, targetEmail, subject);
    }
}
