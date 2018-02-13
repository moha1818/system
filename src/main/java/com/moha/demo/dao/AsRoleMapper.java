package com.moha.demo.dao;

import com.moha.demo.entity.AsRole;

import java.util.List;

public interface AsRoleMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table as_role
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    AsRole selectByPrimaryKey(Integer id);

    //查询角色
     List<AsRole> list();

    //增加角色
     void addRole(AsRole role);

    //修改角色
     void modifyRole(AsRole role);

    //删除角色
     void delRole(Integer id);

    //查询单个角色
     AsRole selectRole(Integer id);
}