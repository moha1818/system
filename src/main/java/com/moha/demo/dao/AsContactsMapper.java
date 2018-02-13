package com.moha.demo.dao;

import com.moha.demo.entity.AsContacts;

import java.util.List;

public interface AsContactsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table as_contacts
     *
     * @mbggenerated Mon Feb 05 14:40:44 CST 2018
     */
    AsContacts selectByPrimaryKey(Integer id);

    //添加联系人
     void addContacts(AsContacts contacts);
    //修改联系人
     void modifyContacts(AsContacts contacts);
    //根据customId查找先关联系人
     List<AsContacts> findList(Integer id);
    //根据主键ID删除联系人
     void deleteContact(Integer id);
}