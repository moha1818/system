<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报表管理</title>
<script type="text/javascript" src="js/laydate.js"></script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link href="css/reportManager.css" type="text/css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
    <script src="dist/js/zui.js"></script>
</head>

<body>
<form action="getReport" method="get">
<div id="box">
操作类型：<s:select name="reportType" list="#{
                        'balance':'余额',
						'preRunning':'资金冻结流水报表',
						'agentRunning':'付款流水报表'
					}"  listKey="key" listValue="value"></s:select>					 
操作时间：<s:textfield class="laydate-icon" id="demo" name="starttime"/> 至 <s:textfield class="laydate-icon" id="demo1" name="endtime"/>
<script type="text/javascript" src="js/laydate-2.js"></script>
    <input type="submit" class="btn btn-primary btn-mini" id="search" value="查询">
</div>
</form>
</body>
</html>