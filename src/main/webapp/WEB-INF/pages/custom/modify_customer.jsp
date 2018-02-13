<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/agentmanage/3.css">
</head>
<script type="text/javascript" src="js/laydate.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/agentmanage.js"></script>
<body>
	<form action="modify_customer?id=<s:property value="#parameters.id"/>" method="post">
		<p>基本信息</p>
		<table style="border: #CCC 1px solid; width: 1200px;">
			<tr>
				<td>企业名称：</td>
				<td><input type="text" name="customs.customName" value="<s:property value="customs.customName"/>" /><span>*<s:fielderror fieldName="customs.customName"/></span></td>
				<td>企业类型：</td>
				<td><s:select name="customs.customType" id="customType"
						list="customTypes" headerKey="-1" headerValue="——请选择类型——"
						listKey="configTypeValue" listValue="configTypeName"></s:select> <span>*<s:fielderror fieldName="customs.customType"/></span>
					<input type="hidden" name="customs.customTypeName"
					id="customTypeName" value="<s:property value="customs.customTypeName"/>" /></td>
			</tr>
			<tr>
				<td>企业主页：</td>
				<td><input type="text" name="customs.siteUrl" value="<s:property value="customs.siteUrl"/>" /></td>
				<td>状态：</td>
				<td><s:select list="#{'1':'启用','0':'停用'}" name="customs.customStatus"></s:select>
				<span>*</span></td>
			</tr>
		</table>

		<p>门户信息</p>
		<table style="border: #CCC 1px solid; width: 1200px;">
			<tr>
				<td>法人代表：</td>
				<td><input type="text" name="customs.bossName" value="<s:property value="customs.bossName"/>" /><span><s:fielderror fieldName="customs.bossName"/></span></td>
				<td>注册日期</td>
				<td><input class="laydate-icon" id="demo"
					name="customs.regDatetime"
					value="<s:date name="customs.regDatetime" format="yyyy-MM-dd" />"><span><s:fielderror fieldName="customs.regDatetime"/></span></td>
			</tr>
			<tr>
				<td>证件类型：</td>
				<td><s:select id="cardType" name="customs.cardType"
						list="cardTypes" headerKey="-1" headerValue="——请选择类型——"
						listKey="configTypeValue" listValue="configTypeName"></s:select> <input
					type="hidden" name="customs.cardTypeName" id="cardTypeName" value="<s:property value="customs.cardTypeName"/>" /><span><s:fielderror fieldName="customs.cardType"/></span></td>
				<td>证件号码：</td>
				<td><input type="text" name="customs.cardNum" value="<s:property value="customs.cardNum"/>" /><span><s:fielderror fieldName="customs.cardNum"/></span></td>
			</tr>
			<tr>
				<td>国家：</td>
				<td><input type="text" name="customs.country" value="中国" value="<s:property value="customs.country"/>"  /></td>
				<td>省/地区：</td>
				<td><s:select name="customs.province" id="province"
						list="provinces" headerKey="-1" headerValue="——请选择省——"
						listKey="provinceId" listValue="province" /><span><s:fielderror fieldName="customs.province"/></span></td>
			</tr>
			<tr>
				<td>公司传真：</td>
				<td><input type="text" name="customs.companyFax" value="<s:property value="customs.companyFax"/>" /><span><s:fielderror fieldName="customs.companyFax"/></span></td>
				<td>城市：</td>
				<td>
				<s:if test="citys!=null">
				<s:select list="citys" id="city" name="customs.city" headerKey="-1" headerValue="——请选择市——" listKey="cityID" listValue="city" ></s:select>
				</s:if>
				<s:else>
				<select id="city" name="customs.city"><option value="-1" selected="selected">——请选择市——</option></select>
				</s:else>
				<span><s:fielderror fieldName="customs.city"/></span></td>
			</tr>
			<tr>
				<td>公司电话：</td>
				<td><input type="text" name="customs.companyTel"  value="<s:property value="customs.companyTel"/>"/><span><s:fielderror fieldName="customs.companyTel"/></span></td>
				<td>区：</td>
				<td>
				<s:if test="areas!=null">
				<s:select list="areas" id="area" name="customs.area" headerKey="-1" headerValue="——请选择区——" listKey="areaID" listValue="area" ></s:select>
				</s:if>
				<s:else>
				<select id="area" name="customs.area"><option value="-1" selected="selected">——请选择区——</option></select>
				</s:else>
				<span><s:fielderror fieldName="customs.area"/></span></td>
			</tr>
			<tr>
				<td>公司地址：</td>
				<td><input type="text" name="customs.companyAddress" value="<s:property value="customs.companyAddress"/>" /></td>
                <td>公司邮箱：</td>
                <td><input type="text" name="customs.email" value="<s:property value="customs.email"/>"/></td>
			</tr>
			<tr>
				<td>备注：</td>
				<td colspan="3"><textarea name="customs.memo" cols="50"
						rows="3" style="resize: none;"><s:property value="customs.memo"/></textarea></td>
			</tr>
		</table>
		<p>
			<a href="javascript:void(0);" style="text-decoration: none"
				id="addline">添加一个联系人</a>
		</p>
		<table class="bordered">
			<thead id="hegin">
				<tr>
					<th>姓名</th>
					<th>电话</th>
					<th>传真</th>
					<th>邮箱</th>
					<th>职务</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<s:iterator value="contacts" status="n">
				<tr>
					<td><input type="text" name="contacts[<s:property value="#n.index" />].contactName" value="<s:property value="contactName"/>" />
					<td><input type="text" name="contacts[<s:property value="#n.index" />].contactTel" value="<s:property value="contactTel"/>" />
					<td><input type="text" name="contacts[<s:property value="#n.index" />].contactFax" value="<s:property value="contactFax"/>"/>
					<td><input type="text" name="contacts[<s:property value="#n.index" />].contactEmail" value="<s:property value="contactEmail"/>"/>
					<td><input type="text" name="contacts[<s:property value="#n.index" />].contactRole" value="<s:property value="contactRole"/>"/>
					<td><a href="javascript:void(0);" onclick="del_data(this,<s:property value="id"/>)"
						style="text-decoration: none">删除</a>
						<input type="hidden" name="contacts[<s:property value="#n.index" />].id" value="<s:property value="id"/>"/>
						</td>
					
				</tr>
		  </s:iterator>
			</tbody>
		</table>
		<div class="last">
			<input type="image" src="image/u59.png" /> <a
				href="pageList"><img src="image/u57.png" /></a>
		</div>
	</form>
	<div style="height: 170px;"></div>
	<script type="text/javascript" src="js/laydate-2.js"></script>
</body>
</html>
