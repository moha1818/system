package com.moha.demo.controller;

import com.moha.demo.entity.HatArea;
import com.moha.demo.entity.HatCity;
import com.moha.demo.service.HatAreaService;
import com.moha.demo.service.HatCityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

public class RegionController extends BaseController {
    @Autowired
    private HatCityService hatCityService;
    @Autowired
    private HatAreaService hatAreaService;

    @RequestMapping(value = "/city")
    @ResponseBody
    public  List<HatCity> findcity(String provinceId) {

        List<HatCity> citys = hatCityService.citys(provinceId);
        return citys;
    }

    // 找区
    @RequestMapping(value = "/area")
    @ResponseBody
    public List<HatArea> findarea(String cityID) {
        List<HatArea> areas = hatAreaService.areas(cityID);
        return areas;
    }
}
