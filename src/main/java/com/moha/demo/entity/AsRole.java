package com.moha.demo.entity;

import java.util.Date;

public class AsRole {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_role.id
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_role.roleName
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    private String roleName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_role.creationTime
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    private Date creationTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_role.createdBy
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    private String createdBy;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_role.lastUpdateTime
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    private Date lastUpdateTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_role.isStart
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    private Integer isStart;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_role.id
     *
     * @return the value of as_role.id
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_role.id
     *
     * @param id the value for as_role.id
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_role.roleName
     *
     * @return the value of as_role.roleName
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_role.roleName
     *
     * @param roleName the value for as_role.roleName
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_role.creationTime
     *
     * @return the value of as_role.creationTime
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public Date getCreationTime() {
        return creationTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_role.creationTime
     *
     * @param creationTime the value for as_role.creationTime
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_role.createdBy
     *
     * @return the value of as_role.createdBy
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public String getCreatedBy() {
        return createdBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_role.createdBy
     *
     * @param createdBy the value for as_role.createdBy
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_role.lastUpdateTime
     *
     * @return the value of as_role.lastUpdateTime
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_role.lastUpdateTime
     *
     * @param lastUpdateTime the value for as_role.lastUpdateTime
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_role.isStart
     *
     * @return the value of as_role.isStart
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public Integer getIsStart() {
        return isStart;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_role.isStart
     *
     * @param isStart the value for as_role.isStart
     *
     * @mbggenerated Mon Feb 05 14:41:09 CST 2018
     */
    public void setIsStart(Integer isStart) {
        this.isStart = isStart;
    }
}