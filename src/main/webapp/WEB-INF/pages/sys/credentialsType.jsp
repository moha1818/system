<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/System configuration management/financialType.css">
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/systemconfig/base.js"></script>
<script type="text/javascript" src="js/systemconfig/financialType.js"></script>
<s:if test="msg!=null">
	<script type="text/javascript">
	var msg = "<s:property value='msg' />"
	alert(msg);	
	</script>
</s:if>
</head>
<body  style="height: 600px;">
	<div style="height:10px;width:900px;"></div>
	<div>
		<div class="add">
			<input type="image" src="image/u2zhengjian.png" border=0 />
		</div>
		<table class="table table-hover table-bordered bordered">
			<tr class="hr_head">
				<td id="td_1">序号</td>
				<td id="td_2">配置类型</td>
				<td id="td_3">是否启用</td>
				<td id="td_4">操作</td>
			</tr>
			<s:iterator value="list" status="li">
				<tr>
					<td><s:property value="#li.index+1" /></td>
					<td><s:property value="configTypeName" /></td>
					<td><s:if test="isStart==1">
							<span style="color: green">启用</span>
						</s:if> <s:else>
							<span style="color: red">停用</span>
						</s:else></td>
					<td><a href="#" class="modify1" onclick="some(this)">修改</a> |<a
						href="deleteSystemConfig?id=<s:property value="id" />&configType=<s:property value="configType" />">删除</a>
					</td>
				</tr>
				<input type="hidden" value="<s:property value="id"/>" />
			</s:iterator>
		</table>
	</div>
	<div id="div_add" style="display: none" class="adduser">
		<form action="addSystemConfig?&configType=6" method="post">
			<s:hidden name="configValue" value="0"></s:hidden>
			<s:hidden name="configTypeValue" value="0"></s:hidden>
			<p align="center">您正进行添加操作</p>
			<hr color="  #C4C4C4" width="235px;" size="1px" />
			<table class="table2">
				<tr>
					<td>类型名称:</td>
					<td><s:textfield style="width: 150px;" id="configTypeName"
							name="configTypeName" /> </td>
				</tr>
				<tr style="height: 20px"><td  colspan="2" style="height: 14px"><span id="spanconfigTypeName"
						class="red"></span></tr>
				<tr>
					<td>是否启用:</td>
					<td><select style="width: 157px;" name="isStart" id="isStart">
							<option selected value="-1">—请选择—</option>
							<option value="1">启用</option>
							<option value="0">停用</option>
					</select> </td>
				</tr>
				<tr style="height: 20px"><td  colspan="2" style="height: 14px"><span id="spanisStart" class="red"></span></td></tr>
				<tr align="center">
					<td><s:submit type="image" src="image/u7.png"
							onclick="return isNum()" /></td>
					<td><s:submit type="image"
							src="image/role authorization/cancel.jpg" class="cancel1"
							onclick="return false" /> </td>
				</tr>
			</table>
		</form>
	</div>
	<div class="modify" style="display: none">
		<form id="action" method="post">
			<p align="center">您正进行修改操作</p>
			<hr color="  #C4C4C4" width="325px;" size="1px" />
			<p align="center">
				配置名称：
				<s:textfield name="configTypeName" value="" id="configTypeName1" />
			</p>
			<p align="center" style="height: 15px"> <span id="spanconfigTypeName1" class="red"></span></p>
			<p align="center">
				是否启用：<select style="width: 150px;" name="isStart" id="isStart1">
					<option selected value="-1">—请选择—</option>
					<option value="1">启用</option>
					<option value="0">停用</option>
				</select>
			</p>
			<p align="center" style="height: 15px"> <span id="spanisStart1" class="red"></span></p>
			<p align="center">
				<s:submit type="image" src="image/role authorization/save.jpg"
					onclick="return isNum1()"  />
				<s:submit type="image" src="image/role authorization/cancel.jpg"
					class="cancel2" onclick="return false" />
			</p>
		</form>
	</div>
		<div style="height:20px;width:900px;"></div>
</body>
</html>