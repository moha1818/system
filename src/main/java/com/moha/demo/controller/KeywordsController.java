package com.moha.demo.controller;

import com.moha.demo.entity.*;
import com.moha.demo.model.Page;
import com.moha.demo.service.*;
import com.moha.demo.utils.sendemail.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class KeywordsController extends BaseController {
    @Autowired
    private AsKeywordsService asKeywordsService;
    @Autowired
    private AsLogsService asLogsService;
    @Autowired
    private AsAccountService asAccountService;
    @Autowired
    private AsSystemconfigService asSystemconfigService;
    @Autowired
    private AsAccountdetailService asAccountdetailService;
    @Autowired
    private AsCustomsService asCustomsService;
    @Autowired
    private EmailService emailService;
    private String msg;

    //门户管理界面列表getPortal
    @RequestMapping(value = "/getPortal")
    public String getPortal(String keywordName,String customName,int pageIndex,int pageSize,int totalPage) throws Exception {

        AsUser user = getCurrUser();

        List<AsKeywords> keywords = asKeywordsService.getportal(user.getId(), pageIndex, pageSize, keywordName, customName);
        int total = asKeywordsService.getCount(user.getId(), keywordName, customName);
        totalPage = total%pageSize==0?(total/pageSize):(total/pageSize+1);
        if(keywords.size()==0){
            msg = "无数据";
        }

        // 添加日志
        String info = "用户进行门户查看操作";
        asLogsService.addLogs(info,user);

        return "/keywords/portalManager";

    }
    @RequestMapping(value = "/portalView")
    public String portalView(Model model,int kid){
        AsKeywords keyword = asKeywordsService.portalView(kid);
        model.addAttribute("keyword",keyword);
        return "/keywords/portalView";
    }

    @RequestMapping(value = "/portalModify")
    public String portalModify(Model model,int kid){
        AsKeywords keyword = asKeywordsService.portalView(kid);
        model.addAttribute("keyword",keyword);
        return "/keywords/portalModify";
    }

    //修改门户portalUpdate
    @RequestMapping(value = "/portalUpdate",method = RequestMethod.POST)
    public String portalUpdate(String appUserName,String appPassword,String iosDownloadUrl,String codeIosUrl,String androidDownloadUrl,String codeAndroidUrl,int kid){
        asKeywordsService.portalUpdate(appUserName, appPassword, iosDownloadUrl, codeIosUrl, androidDownloadUrl, codeAndroidUrl, kid);

        return "redirect:/getPortal";
    }

    @RequestMapping(value = "/keywordsList")
    public String getKeywodsList(int pageIndex,int pageSize,String keywordName,int totalPage){

        List<AsKeywords> keywords = asKeywordsService.getKeywords(pageIndex, pageSize, keywordName);
        int total = asKeywordsService.keywordsCount(keywordName);
        totalPage = total%pageSize==0?(total/pageSize):(total/pageSize+1);

        return "/keywords/keywordsManager";

    }
    @RequestMapping(value = "/keywordsCheck")
    public String keywordsCheck(int pageIndex,int pageSize,String keywordName,int totalPage){

        List<AsKeywords> keywords = asKeywordsService.getKeywords(pageIndex, pageSize, keywordName);
        int total = asKeywordsService.keywordsCount(keywordName);
        totalPage = total%pageSize==0?(total/pageSize):(total/pageSize+1);

        return "/keywords/keywordsre";

    }


    @RequestMapping(value = "/showKey")
    public String showKey(String keywordName,Model model){
        AsKeywords key = asKeywordsService.showKey(keywordName);
        model.addAttribute("key",key);
        return "/keywords/app";
    }

    public String openApp(String appUserName, String appPassword,int kid) throws Exception {
        AsUser user = getCurrUser();
        try{
            asKeywordsService.openApp(appPassword,appUserName,kid);
        }catch(Exception e){
            e.printStackTrace();
        }
        // 添加日志
        String info = "用户进行开通app操作";
        asLogsService.addLogs(info,user);
        return "/keywords/successApp";
    }

    //续费窗口页面信息
    public String showKey2(String keywordName,Model model) throws Exception {

        AsUser user = getCurrUser();
        double money = asAccountService.getAccount(user.getId()).getMoney();
        model.addAttribute("money",money);
        // 服务年限
        int sys_years = asSystemconfigService.type(3, 1).get(0).getConfigTypeValue();
        model.addAttribute("sys_years",sys_years);
        // 服务类型
        List<AsSystemconfig> sys_type = asSystemconfigService.type(2, 1);
        model.addAttribute("sys_type",sys_type);
        // 优惠类型
        List<AsSystemconfig> sys_discount = asSystemconfigService.type(7, 1);
        model.addAttribute("sys_discount",sys_discount);
        AsKeywords key = asKeywordsService.showKey(keywordName);
        model.addAttribute("key",key);
        return "/keywords/renew";
    }

    public String renew(int years,int kid,double price,String keywordName) throws Exception {
        AsUser user = getCurrUser();
        //修改到期年限
        int time = 0;
        if(years==4){
            time = 3;
        }else{
            time = years;
        }
        asKeywordsService.renew(kid, time);
        //账户详情表插入
        AsAccount account = asAccountService.getAccount(user.getId());
        AsAccountdetail accountdetail = new AsAccountdetail();
        accountdetail.setUserId(user.getId());
        accountdetail.setDetailType(5);
        accountdetail.setDetailTypeName("扣除续费资金");
        accountdetail.setMoney(price);
        accountdetail.setAccountMoney(account.getMoney() - price);
        String memo = user.getUserName() + "对" + keywordName + "进行关键词续费操作，扣除续费资金资金："+ time +"年"+ price + "元";
        accountdetail.setMemo(memo);
        asAccountdetailService.freezeMoney(accountdetail);
        // 添加日志
        String info = "用户进行关键词续费操作";
        asLogsService.addLogs(info,user);

        return "/keywords/successRenew";
    }

    @RequestMapping(value = "/keywords_application")
    public String prepare(Model model) throws Exception {
        String balance;
        int sys_years;
        List<AsSystemconfig> sys_type;
        List<AsSystemconfig> sys_discount;
        AsUser user = getCurrUser();
        AsAccount account = asAccountService.getAccount(user.getId());
        if (account != null) {
            DecimalFormat fnum = new DecimalFormat("##0.00");
            balance = fnum.format(account.getMoney());
        } else {
            balance = "无法查询余额";
        }
        model.addAttribute("balance",balance);
        // 服务年限
        sys_years = Integer.parseInt(asSystemconfigService.type(3, 1).get(0).getConfigValue());
        model.addAttribute("sys_years",sys_years);
        // 服务类型
        sys_type = asSystemconfigService.type(2, 1);
        model.addAttribute("sys_type",sys_type);
        // 优惠类型
        sys_discount = asSystemconfigService.type(7, 1);
        model.addAttribute("sys_discount",sys_discount);

        return "/keywords/keywords_application";
    }

    @RequestMapping(value = "/keywords_add",method = RequestMethod.POST)
    public String key_add(AsKeywords keywords) {
        try {
            AsUser user = getCurrUser();
            keywords.setAgentId(user.getId());
            keywords.setAgentName(user.getUserName());
            Double premoney;
            if (keywords.getServiceYears() == 4) {
                premoney = keywords.getPrice() / 2;
            } else {
                premoney = keywords.getPrice() / keywords.getServiceYears();
            }
            System.out.println("SUCCESS");
            keywords.setPreRegFrozenMoney(premoney);
            asKeywordsService.addKeyWord(keywords);
            // 关键词资金冻结操作
            AsAccount account = asAccountService.getAccount(user.getId());
            AsAccountdetail accountdetail = new AsAccountdetail();
            accountdetail.setUserId(user.getId());
            accountdetail.setDetailType(9999);
            accountdetail.setDetailTypeName("预注册冻结资金");
            accountdetail.setMoney(premoney);
            accountdetail.setAccountMoney(account.getMoney() - premoney);
            String memo = user.getUserName() + "对" + keywords.getCustomName() + "进行关键词申请预注册操作，冻结资金：" + premoney + "元";
            accountdetail.setMemo(memo);
            asAccountdetailService.freezeMoney(accountdetail);
            // 添加日志
            String info = "用户进行关键词申请操作";
            asLogsService.addLogs(info,user);

            return "redirect:/keywordsList";
        } catch (Exception e) {
            e.printStackTrace();
            return "/keywords/keywords_application";
        }

    }

    @RequestMapping(value = "/loglist")
    public String see_logs(Page cusPage,Integer current) throws Exception {
        AsUser user = getCurrUser();
        if (current == null) {
            current = 1;
        }
        if(current == 1){
            asLogsService.addLogs("用户进行操作日志查看操作",user);
        }
        int pageSize = 10;
        cusPage=asLogsService.logs(pageSize, current);
        return "/keywords/logs";
    }
    // 查询关键词
    @RequestMapping(value = "/findkey")
    @ResponseBody
    public Map<String, String> findKey(String name) {
        Map<String, String> msg = new HashMap<>();
        if (asKeywordsService.keyCount(name) == 0) {
            msg.put("msg", "success");
        } else {
            msg.put("msg", "fail");
        }
        return msg;
    }

    // 查询syso
    @RequestMapping(value = "/findsys")
    @ResponseBody
    public Map<String, Object> find_sys(AsSystemconfig systemconfig) {
        Map<String, Object> msg = new HashMap<>();
        systemconfig = asSystemconfigService.findsys(systemconfig);
        msg.put("sys", systemconfig);
        return msg;
    }

    //关键词审核操作
    @RequestMapping(value = "/check")
    @ResponseBody
    public Map<String, String> check(String value,String keyname,String cusName,String cusId){
        Map<String, String> msg = new HashMap<>();
        if(value.equals("6")){
            asKeywordsService.updateUse(0, keyname);
            failureSend(Integer.valueOf(cusId),cusName);
            msg.put("msg2", cusName+"状态修改为不使用，操作成功");
            return msg;
        }
        if(value.equals("1")){
            asKeywordsService.updateUse(1, keyname);
            msg.put("msg2", cusName+"状态修改为已使用，操作成功");
            return msg;
        }
        if(value.equals("2")){
            asKeywordsService.updateStatus(1, keyname);
            msg.put("msg2", cusName+"状态修改为审核中，操作成功");
            return msg;
        }
        if(value.equals("3")){
            asKeywordsService.updateStatus(2, keyname);
            successSend(Integer.valueOf(cusId),cusName);
            msg.put("msg2", cusName+"状态修改为审核通过，操作成功");
            return msg;
        }
        if(value.equals("4")){
            asKeywordsService.updateStatus(3, keyname);
            failureSend(Integer.valueOf(cusId),cusName);
            msg.put("msg2", cusName+"状态修改为不通过，操作成功");
            return msg;
        }

        return msg;
    }

    //弹出提示
    @RequestMapping(value = "/msgOut")
    @ResponseBody
    public Map<String, String> msgOut(String value,String cusName){
        Map<String, String> msg = new HashMap<>();
        if(value.equals("6")){
            msg.put("msg1", "您确定要修改【"+cusName+"】的使用状态为不使用吗");
            return msg;
        }
        if(value.equals("1")){
            //keywordsServiceImpl.updateUse(1, keyname);
            msg.put("msg1", "您确定要修改【"+cusName+"】的使用状态为已使用吗");
            return msg;
        }
        if(value.equals("2")){
            //keywordsServiceImpl.updateStatus(1, keyname);
            msg.put("msg1", "您确定要修改【"+cusName+"】的审核状态为审核中吗");
            return msg;
        }
        if(value.equals("3")){
            //keywordsServiceImpl.updateStatus(2, keyname);
            msg.put("msg1", "您确定要修改【"+cusName+"】的审核状态为审核通过吗");
            return msg;
        }
        if(value.equals("4")){
            //keywordsServiceImpl.updateStatus(3, keyname);
            msg.put("msg1", "您确定要修改【"+cusName+"】的审核状态为不通过吗");
            return msg;
        }

        return msg;
    }

    private void successSend(Integer customId,String customName){
        String email=asCustomsService.findone(Integer.valueOf(customId)).getEmail();
        Map map=new HashMap();
        map.put("name",customName);
        map.put("targetVM","supplierAuthPass.vm");
        emailService.sendEmail(map,"cnEmail.vm",email,"eGTCP审核通过");
    }
    private void failureSend(Integer customId,String customName){
        String email=asCustomsService.findone(Integer.valueOf(customId)).getEmail();
        Map map=new HashMap();
        map.put("name",customName);
        map.put("targetVM","supplierAuthRefusal.vm");
        emailService.sendEmail(map,"cnEmail.vm",email,"eGTCP审核不通过");
    }
}
