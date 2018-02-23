package com.moha.demo.controller;

import com.moha.demo.entity.*;
import com.moha.demo.model.Page;
import com.moha.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
@Controller
public class CustomController extends BaseController {
    @Autowired
    private AsCustomsService asCustomsService;
    @Autowired
    private AsLogsService asLogsService;
    @Autowired
    private AsContactsService asContactsService;
    @Autowired
    private HatProvinceService hatProvinceService;
    @Autowired
    private HatCityService hatCityService;
    @Autowired
    private HatAreaService hatAreaService;
    @RequestMapping(value = "/add_cus")
    public String show_add(){
        return "/custom/add_customer";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(AsCustoms customs, List<AsContacts> contacts) {
        try {
            AsUser user = getCurrUser();
            customs.setAgentCode(user.getUserCode());
            customs.setAgentName(user.getUserName());
            customs.setAgentId(user.getId());
            asCustomsService.addCus(customs,contacts,user);
            return "redirect:/pageList";
        } catch (Exception e) {
            e.printStackTrace();
            return "/custom/add_customer";
        }
    }
    @RequestMapping(value = "/pageList")
    public String pageList() {
        System.out.println("111");
        return "/custom/acustomer_manage";
    }

    @RequestMapping(value = "/pages")
    @ResponseBody
    public Page pages(Page cusPage,Integer current,String name,Integer limit) throws Exception {
        AsUser user = getCurrUser();
        if (current == null) {
            current = 1;
        }
        int pageSize = limit;

        if (name != null) {
            if (name.equals("")) {
                name = null;
            } else {
                if(current==1){
                    // 添加日志
                    String info = "用户进行客户搜索操作：搜索内容为：" + name;
                    asLogsService.addLogs(info,user);
                }
            }
        }else{
            if(current==1){
                // 添加日志
                String info = "用户进行代理商客户管理查看操作";
                asLogsService.addLogs(info,user);
            }
        }
        cusPage = asCustomsService.getPage(pageSize, current, name);
        return cusPage;
    }


    // 修改客户信息，显示客户资料
    // 查看客户信息
    @RequestMapping(value = "/modify_cus")
    public String modify_show(Integer id) {
        AsCustoms customs = asCustomsService.findone(id);
        List<AsContacts> contacts = asContactsService.findList(id);
        // 省的实体类
        HatProvince province = hatProvinceService.pro(customs.getProvince());

        List<HatCity> citys = hatCityService.citys(customs.getProvince());
        List<HatArea> areas = hatAreaService.areas(customs.getCity());
       String cityName;
       String areaName;

        // 根据customs.city在citys里找相关市名
        for (HatCity city : citys) {
            if (city.getCityid().equals(customs.getCity())) {
                cityName = city.getCity();
            }

        }
        // 根据customs.area在areas里找相关区名
        for (HatArea area : areas) {
            if (area.getAreaID().equals(customs.getArea())) {
                areaName = area.getArea();
            }
        }
        return "/custom/modify_customer";
    }

    // 修改客户信息
    @RequestMapping(value = "/modify_customer",method = RequestMethod.POST)
    public String modify(AsCustoms customs,List<AsContacts> contacts,Integer id) {
        try {
            customs.setId(id);
            asCustomsService.modifyCus(customs);
            if(contacts!=null){
                for (AsContacts c : contacts) {
                    c.setCustomId(id);
                    if (c.getId() != null) {
                        asContactsService.modifyContacts(c);
                        // 修改
                    } else {
                        asContactsService.addContacts(c);
                        // 添加
                    }
                }
            }
            // 添加日志
            String info = "用户修改客户信息操作";
            AsUser user = getCurrUser();
            asLogsService.addLogs(info,user);
            return "redirect:/pageList";
        } catch (Exception e) {
            e.printStackTrace();
            return "/custom/modify_customer";
        }
    }


    // 删除一条联系人
    @RequestMapping(value = "/delcontact")
    @ResponseBody
    public Map<String, String> delete_contact(Integer id) {
        Map<String, String> msg = new HashMap<>();
        try {
            asContactsService.deleteContact(id);
            System.out.println("success");
            msg.put("msg", "SUCCESS");
        } catch (RuntimeException r) {
            r.printStackTrace();
            msg.put("msg", "fail");
        }
        return msg;
    }


    // 状态开启关闭
    @RequestMapping(value = "/open")
    @ResponseBody
    public Map<String, String> state(String status,Integer id) {
        Map<String, String> msg = new HashMap<>();
        try {
            asCustomsService.state(id, status);
            msg.put("msg", "SUCCESS");
        } catch (RuntimeException r) {
            r.printStackTrace();
            msg.put("msg", "fail");
        }
        return msg;
    }

    // 模糊查询
    @RequestMapping(value = "/findcus")
    @ResponseBody
    public List<AsCustoms> findCusSup(String name) {
        List<AsCustoms> customs = asCustomsService.likeCus(name);
        customs=customs.stream().filter(custom->custom.getCustomType().equals(1)).collect(Collectors.toList());
        return customs;
    }
    @RequestMapping(value = "/findCusSup")
    @ResponseBody
    public List<AsCustoms> findCus(String name){
        List<AsCustoms> customs = asCustomsService.likeCus(name);
        return customs;
    }
}
