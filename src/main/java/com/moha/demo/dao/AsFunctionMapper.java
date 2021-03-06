package com.moha.demo.dao;

import com.moha.demo.entity.AsFunction;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AsFunctionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table as_function
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    AsFunction selectByPrimaryKey(Integer id);

    //查询所有功能
    public List<AsFunction> list();

    //查找该角色的function
    public int authorization(@Param("roleId")Integer roleId, @Param("functionCode")String functionCode);
}