package com.moha.demo.dao;

import com.moha.demo.entity.HatCity;

import java.util.List;

public interface HatCityMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table hat_city
     *
     * @mbggenerated Mon Feb 05 15:13:41 CST 2018
     */
    HatCity selectByPrimaryKey(Integer id);

    //根据provinceId查询市
    List<HatCity> citys(String provinceId);
}