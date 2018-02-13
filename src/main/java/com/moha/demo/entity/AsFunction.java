package com.moha.demo.entity;

import java.util.Date;

public class AsFunction {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.id
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.functionCode
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private String functionCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.functionName
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private String functionName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.creationTime
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private Date creationTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.createdBy
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private String createdBy;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.lastUpdateTime
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private Date lastUpdateTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.funcUrl
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private String funcUrl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.isStart
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private Integer isStart;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column as_function.parentId
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    private Integer parentId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.id
     *
     * @return the value of as_function.id
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.id
     *
     * @param id the value for as_function.id
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.functionCode
     *
     * @return the value of as_function.functionCode
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public String getFunctionCode() {
        return functionCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.functionCode
     *
     * @param functionCode the value for as_function.functionCode
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setFunctionCode(String functionCode) {
        this.functionCode = functionCode == null ? null : functionCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.functionName
     *
     * @return the value of as_function.functionName
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public String getFunctionName() {
        return functionName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.functionName
     *
     * @param functionName the value for as_function.functionName
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setFunctionName(String functionName) {
        this.functionName = functionName == null ? null : functionName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.creationTime
     *
     * @return the value of as_function.creationTime
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public Date getCreationTime() {
        return creationTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.creationTime
     *
     * @param creationTime the value for as_function.creationTime
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.createdBy
     *
     * @return the value of as_function.createdBy
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public String getCreatedBy() {
        return createdBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.createdBy
     *
     * @param createdBy the value for as_function.createdBy
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.lastUpdateTime
     *
     * @return the value of as_function.lastUpdateTime
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.lastUpdateTime
     *
     * @param lastUpdateTime the value for as_function.lastUpdateTime
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.funcUrl
     *
     * @return the value of as_function.funcUrl
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public String getFuncUrl() {
        return funcUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.funcUrl
     *
     * @param funcUrl the value for as_function.funcUrl
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setFuncUrl(String funcUrl) {
        this.funcUrl = funcUrl == null ? null : funcUrl.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.isStart
     *
     * @return the value of as_function.isStart
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public Integer getIsStart() {
        return isStart;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.isStart
     *
     * @param isStart the value for as_function.isStart
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setIsStart(Integer isStart) {
        this.isStart = isStart;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column as_function.parentId
     *
     * @return the value of as_function.parentId
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column as_function.parentId
     *
     * @param parentId the value for as_function.parentId
     *
     * @mbggenerated Mon Feb 05 14:40:54 CST 2018
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}