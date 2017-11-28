package com.moha.demo.controller;

import com.moha.demo.entity.View;
import com.moha.demo.service.DemoService;
import com.moha.demo.threadpool.StartTaskThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/*JSP页面多个同名数据传到controller*/
@Controller
@RequestMapping("/demo")
public class DemoController {
    @Autowired
    private DemoService demoService;

    @RequestMapping("show")
    public String demo(){
        return "/index";
    }
    @RequestMapping("form")
    public String form(){
        return "/formSubmit";
    }
    @ResponseBody
    @RequestMapping(value = "fff",method = RequestMethod.POST)
    public int vs(@RequestBody List<View> views){
        for(View v : views){
            v.getId();
        }
        return 1;
    }

    @ResponseBody
    @RequestMapping(value = "fffs",method = RequestMethod.POST)
    public int vs(Integer[] id,String[] name){

        return 1;
    }
    @ResponseBody
    @RequestMapping(value = "fffss",method = RequestMethod.POST)
    public int vs(Integer[] id){

        return 1;
    }


    @ResponseBody
    @RequestMapping(value = "tms",method = RequestMethod.GET)
    public int vss(Integer[] id){
        demoService.ser();
        return 1;
    }




}
