package com.moha.demo.controller;

import com.moha.demo.entity.AsSystemconfig;
import com.moha.demo.entity.AsUser;
import com.moha.demo.service.AsLogsService;
import com.moha.demo.service.AsSystemconfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
@Controller
public class SystemController extends BaseController {
    @Autowired
    private AsSystemconfigService asSystemconfigService;
    @Autowired
    private AsLogsService asLogsService;

    @RequestMapping(value = "/sys/{name}")
    public ModelAndView test(@PathVariable String name,Integer configType){
        List<AsSystemconfig> list = asSystemconfigService.getConfig(configType);
        return new ModelAndView("/sys/{"+name+"}","list",list);
    }

    @RequestMapping(value = "/sys2/{name}")
    public ModelAndView showSTOrAA(@PathVariable String name,Integer configType) {
        ModelAndView modelAndView = new ModelAndView();
        List<AsSystemconfig> list = asSystemconfigService.getConfig(configType);
        AsSystemconfig systemconfig = list.get(0);
        configType = systemconfig.getConfigType();
        String configTypeName = systemconfig.getConfigTypeName();
        Integer configTypeValue = systemconfig.getConfigTypeValue();
        String configValue = systemconfig.getConfigValue();
        Integer id = systemconfig.getId();
        Integer isStart = systemconfig.getIsStart();
        modelAndView.addObject("systemconfig",systemconfig);
        modelAndView.addObject("configType",configType);
        modelAndView.addObject("configTypeName",configTypeName);
        modelAndView.addObject("configTypeValue",configTypeValue);
        modelAndView.addObject("configValue",configValue);
        modelAndView.addObject("id",id);
        modelAndView.addObject("isStart",isStart);
        modelAndView.setViewName("/sys/{"+name+"}");
        return modelAndView;
    }

    @RequestMapping(value = "/deleteSystemConfig")
    public String deleteSystemConfig(Integer id,Integer configType,Model model) throws Exception {
        AsUser user = getCurrUser();
        String msg;
        asSystemconfigService.delete(id);
        if (configType == 1) {
            msg = "删除成功";
            model.addAttribute("msg",msg);
            String info = "用户删除财务类型操作";
            asLogsService.addLogs(info,user);
            return "/sys/financialType";
        } else if (configType == 2) {
            msg = "删除成功";
            String info = "用户删除店铺类型操作";
            model.addAttribute("msg",msg);
            asLogsService.addLogs(info,user);
            return "/sys/serviceType";
        } else if (configType == 5) {
            msg = "删除成功";
            model.addAttribute("msg",msg);
            String info = "用户删除证件类型操作";
            asLogsService.addLogs(info,user);
            return "/sys/clientType";
        } else if (configType == 6) {
            msg = "删除成功";
            model.addAttribute("msg",msg);
            String info = "用户删除企业类型操作";
            asLogsService.addLogs(info,user);
            return "/sys/credentialsType";
        } else if (configType == 7) {
            msg = "删除成功";
            model.addAttribute("msg",msg);
            String info = "用户删除优惠类型操作";
            asLogsService.addLogs(info,user);
            return "/sys/preferentialType";
        } else {
            return "";
        }
    }

    @RequestMapping(value = "/addSystemConfig")
    public String addSystemConfig(Integer configType,String configTypeName,Integer configTypeValue,String configValue,Integer isStart,Model model) throws Exception {
        String msg;
        AsUser user = getCurrUser();
        AsSystemconfig scg = new AsSystemconfig();
        scg.setConfigType(configType);
        scg.setConfigTypeName(configTypeName);
        scg.setConfigTypeValue(configTypeValue);
        scg.setConfigValue(configValue);
        scg.setIsStart(isStart);
        try {
            asSystemconfigService.addSystemconfig(scg);
        }catch (RuntimeException r) {
            r.printStackTrace();

            if (configType == 1) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加财务类型失败";
                asLogsService.addLogs(info,user);
                return "financialType";
            } else if (configType == 2) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加店铺类型失败";
                asLogsService.addLogs(info,user);
                return "serviceType";
            } else if (configType == 5) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加企业类型失败";
                asLogsService.addLogs(info,user);
                return "clientType";
            } else if (configType == 6) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加证件类型操作失败";
                asLogsService.addLogs(info,user);
                return "credentialsType";
            } else if (configType == 7) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加优惠类型失败";
                asLogsService.addLogs(info,user);
                return "preferentialType";
            } else {
                msg = "添加错误";
                model.addAttribute("msg",msg);
                String info = "用户添加系统配置失败";
                asLogsService.addLogs(info,user);
                return "financialType";
            }
        }
        if (configType == 1) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加财务类型操作";
            asLogsService.addLogs(info,user);
            return "financialType";
        } else if (configType == 2) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加店铺类型操作";
            asLogsService.addLogs(info,user);
            return "serviceType";
        } else if (configType == 5) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加企业类型操作";
            asLogsService.addLogs(info,user);
            return "clientType";
        } else if (configType == 6) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加证件类型操作";
            asLogsService.addLogs(info,user);
            return "credentialsType";
        } else if (configType == 7) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加优惠类型操作";
            asLogsService.addLogs(info,user);
            return "preferentialType";
        } else {
            msg = "添加错误";
            model.addAttribute("msg",msg);
            String info = "用户添加系统配置失败";
            asLogsService.addLogs(info,user);
            return "financialType";
        }
    }

    @RequestMapping(value = "/updateSystemconfig")
    public String updateSystemconfig(Integer configType,String configTypeName,Integer configTypeValue,String configValue,Integer isStart,Model model,Integer id) throws Exception {
        String msg;
        AsUser user = getCurrUser();
        AsSystemconfig s = new AsSystemconfig();
        s.setConfigType(configType);
        s.setConfigTypeName(configTypeName);
        s.setConfigTypeValue(configTypeValue);
        s.setConfigValue(configValue);
        s.setId(id);
        s.setIsStart(isStart);
        try {
            asSystemconfigService.update(s);
        } catch (RuntimeException r) {
            r.printStackTrace();
            if (configType == 1) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加财务类型失败";
                asLogsService.addLogs(info,user);
                return "financialType";
            } else if (configType == 2) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加店铺类型失败";
                asLogsService.addLogs(info,user);
                return "serviceType";
            } else if (configType == 5) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加企业类型失败";
                asLogsService.addLogs(info,user);
                return "clientType";
            } else if (configType == 6) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加证件类型操作失败";
                asLogsService.addLogs(info,user);
                return "credentialsType";
            } else if (configType == 7) {
                msg = "添加失败";
                model.addAttribute("msg",msg);
                String info = "用户添加优惠类型失败";
                asLogsService.addLogs(info,user);
                return "preferentialType";
            } else {
                msg = "添加错误";
                model.addAttribute("msg",msg);
                String info = "用户添加系统配置失败";
                asLogsService.addLogs(info,user);
                return "financialType";
            }
        }
        if (configType == 1) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加财务类型操作";
            asLogsService.addLogs(info,user);
            return "financialType";
        } else if (configType == 2) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加店铺类型操作";
            asLogsService.addLogs(info,user);
            return "serviceType";
        } else if (configType == 5) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加企业类型操作";
            asLogsService.addLogs(info,user);
            return "clientType";
        } else if (configType == 6) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加证件类型操作";
            asLogsService.addLogs(info,user);
            return "credentialsType";
        } else if (configType == 7) {
            msg = "添加成功";
            model.addAttribute("msg",msg);
            String info = "用户成功添加优惠类型操作";
            asLogsService.addLogs(info,user);
            return "preferentialType";
        } else {
            msg = "添加错误";
            model.addAttribute("msg",msg);
            String info = "用户添加系统配置失败";
            asLogsService.addLogs(info,user);
            return "financialType";
        }
    }

    @RequestMapping(value = "/showSystemConfig")
    public AsSystemconfig showSystemConfig(Integer id) throws Exception {
        AsUser user = getCurrUser();
        AsSystemconfig systemconfig= asSystemconfigService.findByID(id);
        Integer configType = systemconfig.getConfigType();
        if (configType == 1) {
            String info = "用户浏览财务类型配置";
            asLogsService.addLogs(info,user);
        } else if (configType == 2) {
            String info = "用户浏览店铺类型配置";
            asLogsService.addLogs(info,user);
        } else if (configType == 5) {
            String info = "用户浏览企业类型配置";
            asLogsService.addLogs(info,user);
        } else if (configType == 6) {
            String info = "用户浏览证件类型配置";
            asLogsService.addLogs(info,user);
        } else if (configType == 7) {
            String info = "用户浏览优惠类型配置";
            asLogsService.addLogs(info,user);
        }
        return systemconfig;
    }
}
