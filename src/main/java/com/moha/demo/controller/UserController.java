package com.moha.demo.controller;

import com.moha.demo.entity.AsKeywords;
import com.moha.demo.entity.AsLogs;
import com.moha.demo.entity.AsRole;
import com.moha.demo.entity.AsUser;
import com.moha.demo.model.Page;
import com.moha.demo.model.PassStatus;
import com.moha.demo.service.AsKeywordsService;
import com.moha.demo.service.AsLogsService;
import com.moha.demo.service.AsRoleService;
import com.moha.demo.service.AsUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import java.util.List;

@Controller
public class UserController extends BaseController{
    @Autowired
    private AsUserService asUserService;
    @Autowired
    private AsLogsService asLogsService;
    @Autowired
    private AsKeywordsService asKeywordsService;

    @Autowired
    private AsRoleService asRoleService;
    private String msg;

    @RequestMapping(value = "/")
    public String system(){
        return "/user/logins";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String usercode,String password, String code,HttpServletRequest request) throws Exception {
        AsUser user = null;
        if(getCurrUser()==null){
            String sessionCode = (String) request.getSession().getAttribute("code");
            if(sessionCode!=null && !sessionCode.equalsIgnoreCase(code)){
                msg = "验证码错误";
                return "redirect:/";
            }

            if(usercode!=null&& !usercode.equals("") && password!=null && !password.equals("")){
                user = asUserService.login(usercode, password);
            }else{
                user=null;
                msg = "登录账号密码不得为空";
                return "redirect:/";
            }
            if(user==null){
                msg = "登录失败，用户名或密码错误";
                return "redirect:/";
            }
            request.getSession().setAttribute("user", user);
        }
        String info = "登录系统";
        asLogsService.addLogs(info,user);
        return "redirect:/index";
    }

    @RequestMapping(value = "/loginOut")
    public String loginOut(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "redirect:/";
    }


    //修改密码
    @RequestMapping(value = "/pModify",method = RequestMethod.POST)
    public String pModify(String oldpwd,String newpwd,HttpServletRequest request) throws Exception {

        AsUser user = getCurrUser();

        if(!oldpwd.equals(user.getUserPassword())){

            msg = "修改失败，当前密码不正确";
            return "redirect:/index";
        }

        asUserService.pModify(user.getId(), newpwd);
        request.getSession().removeAttribute("user");
        return "redirect:/";

    }

    //首页内嵌框架显示上次登录时间
    @RequestMapping(value = "/index")
    public String index(Model model) throws Exception {

        AsUser user = getCurrUser();

        Date lastLoginT = user.getLastLoginTime();
        model.addAttribute("lastLoginT",lastLoginT);
        //账户余额
        //account = accountServiceImpl.getAccount(user.getId());
        //修改上次登录时间为当前时间
        asUserService.lastLogin(user.getId());
        List<AsKeywords> keywordsList=asKeywordsService.allkeywords();
        Integer keywords=keywordsList.size();
        Integer authKeys= Math.toIntExact(keywordsList.stream().filter(Keywords -> Keywords.getIsUse().equals(1) && Keywords.getCheckStatus().equals(0)).count());
        Integer authingKeys= Math.toIntExact(keywordsList.stream().filter(Keywords ->  Keywords.getIsUse().equals(1) && Keywords.getCheckStatus().equals(1)).count());
        Integer passedKeys= Math.toIntExact(keywordsList.stream().filter(Keywords ->  Keywords.getIsUse().equals(1) && Keywords.getCheckStatus().equals(2)).count());
        Integer noPassedKeys= Math.toIntExact(keywordsList.stream().filter(Keywords ->  Keywords.getIsUse().equals(1) && Keywords.getCheckStatus().equals(3)).count());
        Integer uselessKeys= Math.toIntExact(keywordsList.stream().filter(Keywords ->  Keywords.getIsUse().equals(0)).count());
        PassStatus passStatus=new PassStatus(keywords,authKeys,authingKeys,passedKeys,noPassedKeys,uselessKeys);
        model.addAttribute("passStatus",passStatus);
        List<AsLogs> logs=asLogsService.allLogs();
        model.addAttribute("logs",logs);
        return "/user/Amanage";
    }

    @RequestMapping(value = "/code")
    public void code(HttpServletRequest request, HttpServletResponse response){
        //响应头
        // 设置输出格式
        response.setContentType("image/jpeg");

        // 图片的宽度
        int width = 100;
        // 图片的高度
        int height = 25;
        // 图片中的内容 4个字符
        char[] code = new char[4];
        // 存储随机产生的4个字符
        String arr = "123456789piuytrewqasdfghjklmnbvcxzQWERTYUIPLKJHGFDSAZXCVBNM";
        Random random = new Random();
        for (int i = 0; i < 4; i++) {
            code[i] = arr.charAt(random.nextInt(arr.length()));
        }


        // 在内存中生成一张图片
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 获得这张图片的画笔(句柄)
        Graphics g = image.getGraphics();
        // 设置画笔的颜色
        g.setColor(Color.white);
        // 给图片绘制背景色
        g.fillRect(0, 0, width, height);

        // 在图片上写入文字
        // 设置字体和颜色
        g.setFont(new Font("宋体",Font.BOLD,22));
        g.setColor(Color.black);
        for(int i=0;i<code.length;i++){
            g.setColor(new Color(new Random().nextInt(255),new Random().nextInt(255),new Random().nextInt(255)));
            g.drawString(Character.toString(code[i]),25*i+3,20 );
        }
        // 添加干扰线
        for(int i=0;i<code.length;i++){
            g.setColor(new Color(new Random().nextInt(255),new Random().nextInt(255),new Random().nextInt(255)));
            g.drawLine(new Random().nextInt(width), new Random().nextInt(height), new Random().nextInt(width), new Random().nextInt(height));
        }
        // 释放
        g.dispose();
        // 图片写入到响应流
        OutputStream os= null;
        try {
            os = response.getOutputStream();

        ImageIO.write(image, "JPEG",os);
        os.flush();
        os.close();
        os=null;
        response.flushBuffer();

        } catch (IOException e) {
            e.printStackTrace();
        }
        // 保存生成的验证码，以便后续业务验证(注意,验证后，请清除这个session)
        //req.setAttribute("code", String.valueOf(code));
        request.getSession().setAttribute("code", String.valueOf(code));
    }

    @RequestMapping(value = "/userma")
    public String userma(String userName,Integer isStart,Integer roleid,Page page){
        int pageIndex;
        if(userName==null||userName.equals("")){
            userName=null;
        }
        System.out.println(userName);
        if(roleid==null){
            roleid=0;
        }
        if(isStart==null ||isStart==2 ){
            isStart=2;
        }
        if (page.getPageIndex()==0) {
            page.setPageIndex(1);
        }
        pageIndex = page.getPageIndex();
        page.setPageSize(10);
        List<AsUser> userlist=asUserService.userlist(page.getPageIndex(),page.getPageSize(),userName,roleid,isStart);
        page.setList(userlist);
        page.setTotalCount(asUserService.num(userName, roleid, isStart));
        List<AsRole> rolemalist=asRoleService.list();
        return "/user/userma";
    }

    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public String addUser(AsUser users) throws Exception {
        AsUser user = getCurrUser();
        try {

            users.setCreationTime(new Date());
            users.setLastLoginTime(new Date());
            users.setLastUpdateTime(new Date());
            users.setCreatedBy(user.getUserCode());
            //账户默认启示资金
            Double money=(double) 10000;
            asUserService.addUser(users,money);
        } catch (RuntimeException e) {
            e.printStackTrace();
            return "redirect:/userma";
        }
        return "redirect:/userma";
    }
    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public String updateUser(AsUser users){
        try {
            users.setLastUpdateTime(new Date());
            asUserService.modifyUser(users);
        } catch (RuntimeException e) {
            e.printStackTrace();
            return "redirect:/userma";
        }
        return "redirect:/userma";
    }
    @RequestMapping(value = "/selectUser")
    @ResponseBody
    public Map<String, Object> selectUser(Integer id){
        Map<String, Object> msg = new HashMap<>();
        try {
            AsUser user=asUserService.user(id);
            msg.put("user", user);
        } catch (Exception e) {
            msg.put("info","error");
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping(value = "/delUser",method = RequestMethod.POST)
    public String delUser(Integer id){

        asUserService.delUser(id);
        return "redirect:/userma";
    }


    //用户模糊查询
    @RequestMapping(value = "/finduser")
    @ResponseBody
    public List<AsUser> findUsers(String name){
        List<AsUser> users=asUserService.findUsers(name);
        return users;
    }
}
