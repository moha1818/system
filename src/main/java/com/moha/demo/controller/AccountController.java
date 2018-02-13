package com.moha.demo.controller;

import com.moha.demo.entity.AsAccountdetail;
import com.moha.demo.entity.AsSystemconfig;
import com.moha.demo.entity.AsUser;
import com.moha.demo.service.AsAccountdetailService;
import com.moha.demo.service.AsSystemconfigService;
import com.moha.demo.utils.sendemail.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class AccountController extends BaseController{

    @Autowired
    private AsAccountdetailService asAccountdetailService;

    @Autowired
    private AsSystemconfigService asSystemconfigService;
    @Autowired
    private EmailService emailService;

    @RequestMapping(value = "/openEmail")
    public String openEmail() {
        return "/account/email";
    }

    @RequestMapping(value = "/showDetail")
    public String showDetail(Date starttime,Date endtime,int pageIndex,int pageSize,int totalPage,int detailType) throws Exception {
        AsUser user = getCurrUser();
        List<AsAccountdetail> detail = asAccountdetailService.showDetail(user.getId(), pageIndex, pageSize, detailType, starttime, endtime);
        int total = asAccountdetailService.detailCount(user.getId(), detailType, starttime, endtime);
        totalPage = total%pageSize==0?(total/pageSize):(total/pageSize+1);

        return "/account/accountDetail";
    }

    @RequestMapping(value = "/prepay")
    public String prepay(int id,Date starttime,Date endtime,int pageIndex,int pageSize,int totalPage,int detailType) throws Exception {
        List<AsAccountdetail> detail;
        if(id==0){
            AsUser user = getCurrUser();
            detail = asAccountdetailService.showDetail(user.getId(), pageIndex, pageSize, detailType, starttime, endtime);
            int total = asAccountdetailService.detailCount(user.getId(), detailType, starttime, endtime);
            totalPage = total%pageSize==0?(total/pageSize):(total/pageSize+1);
        }else{
            detail = asAccountdetailService.showDetail(id, pageIndex, pageSize, detailType, starttime, endtime);
            int total = asAccountdetailService.detailCount(id, detailType, starttime, endtime);
            totalPage = total%pageSize==0?(total/pageSize):(total/pageSize+1);
        }

        List<AsSystemconfig> config = new ArrayList<>();
        config.addAll(asSystemconfigService.getConfig(1));

        return "/account/agentPrepay";
    }
    public String msg;
    @RequestMapping(value = "/sub_financial",method = RequestMethod.POST)
    public String addfinancial(Integer id,Integer detailType,String detailTypeName,String money,String memo) throws Exception {
       AsUser user = getCurrUser();
        try{
            int n=asAccountdetailService.financial(money, user.getId(), id, detailType, detailTypeName,memo);
            if(n==0){
                msg="成功";
                System.out.println(msg);
                return "/account/financial";
            }else if(n==1){
                msg="失败：您的余额不足";
                System.out.println(msg);
                return "/account/financial";
            }else if(n==2){
                msg="失败：该用户余额不足";
                System.out.println(msg);
                return "/account/financial";
            }else{
                return "/account/financial";
            }
        }catch(RuntimeException r){
            r.printStackTrace();
            msg="失败：请输入完整";
            return "/account/financial";
        }
    }

    @RequestMapping(value = "/sendEmail")
    @ResponseBody
    public Map<String, Object> sendEmail(String eidGroup,String targetEmail,String content,String subject){
        Map<String, Object> msg = new HashMap<>();
        if(eidGroup!=null && targetEmail!=null) {
            String[] eids = eidGroup.split(",");//企业ID
            String[] emails = targetEmail.split(",");//企业邮箱

            for (String email : emails) {
                emailService.sendEmail(content, email, subject);
            }
            msg.put("msg",1);
        }else{
            msg.put("msg",0);
        }

        return msg;
    }
}
