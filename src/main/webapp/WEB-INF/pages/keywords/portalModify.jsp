<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改门户信息</title>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/portal.js"></script>
<link href="css/portal/portal.css" type="text/css" rel="stylesheet" />
</head>
 <body>
 <form action="portalUpdate" method="post">
 <h3>注册的移动云端信息</h3>
 <input type="text" id="kid" name="kid" value="<s:property value='keyword.id'/>">
 	<table id="top-ta">
		<tr>
			<td>登录账号：<input type="text" name="appUserName" id="appUserName" value="<s:property value='keyword.appUserName'/>"/></td><td>登录密码：<input type="text" name="appPassword" id="appPassword" value="<s:property value='keyword.appPassword'/>"/></td>
		</tr>
		<tr>
			<td>关键词：hanlu</td><td>登录地址：http://url</td>
		</tr>
		<tr>
			<td>客户端下载地址(IOS)：<input type="text" name="iosDownloadUrl" value="<s:property value='keyword.iosDownloadUrl'/>"/></td><td>二维码下载地址(IOS)：<input type="text" name="codeIosUrl" value="<s:property value='keyword.codeIosUrl'/>"/></td>
		</tr>
		<tr>
			<td>客户端下载地址(Android)：<input type="text" name="androidDownloadUrl" value="<s:property value='keyword.androidDownloadUrl'/>"/></td><td>二维码下载地址(Android)：<input type="text" name="codeAndroidUrl" value="<s:property value='keyword.codeAndroidUrl'/>"/></td>
		</tr>
		<tr>
			<td>关键词开始日期：<s:date name="keyword.regDatetime" format="yyyy-mm-dd"/></td><td>关键词结束日期：<s:date name="keyword.regPassDatetime" format="yyyy-mm-dd"/></td>
		</tr>
		<tr>
			<td>关键词有效年限：20年</td>
		</tr>
	</table>
  <h3>基本信息</h3>
 	<table id="mid-ta">
		<tr>
			<td>企业名称：<s:property value="keyword.customName"/></td><td>状态：<s:if test="keyword.customs.customStatus==1">启用</s:if><s:if test="keyword.customs.customStatus==0">停用</s:if></td>
		</tr>
		<tr>
			<td>企业类型：<s:property value="keyword.customs.customTypeName"/></td><td>企业主页：<s:property value="keyword.customs.siteUrl"/></td>
		</tr>
	</table>
	 <h3>门户信息</h3>
 	<table id="foot-ta">
		<tr>
			<td>法人代表：<s:property value="keyword.customs.bossName"/></td><td>注册日期：<s:date name="keyword.customs.regDatetime"/></td>
		</tr>
		<tr>
			<td>证件类型：<s:property value="keyword.customs.cardTypeName"/></td><td>证件号码：<s:property value="keyword.customs.cardNum"/></td>
		</tr>
		<tr>
			<td>国家：<s:property value="keyword.customs.country"/></td><td>省/地区：<s:property value="keyword.customs.pro.province"/></td>
		</tr>
		<tr>
			<td>区：<s:property value="keyword.customs.are.area"/></td><td>城市：<s:property value="keyword.customs.cit.city"/></td>
		</tr>
		<tr>
			<td>公司电话：<s:property value="keyword.customs.companyTel"/></td><td>公司传真：<s:property value="keyword.customs.companyFax"/></td>
		</tr>
		<tr>
			<td>公司地址：<s:property value="keyword.customs.companyAddress"/></td><td>备注：<s:property value="keyword.customs.memo"/></td>
		</tr>
	</table>
	<h3>联系人信息</h3>
	<table id="end-ta">
		<tr>
			<td>姓名</td>
			<td>电话</td>
			<td>传真</td>
			<td>邮箱</td>
			<td>职务</td>
		</tr>
		<s:iterator value="keyword.customs.contacts" var="c">
		<tr>
			<td><s:property value="#c.contactName"/></td>
			<td><s:property value="#c.contactTel"/></td>
			<td><s:property value="#c.contactFax"/></td>
			<td><s:property value="#c.contactEmail"/></td>
			<td><s:property value="#c.contactRole"/></td>
		</tr>
		</s:iterator>
	</table>
	<table id="but">
		<tr>
			<td><input id="save" type="image" onclick="return check()"  src="image/portal/u2.png"/></td>
			<td><input id="back" type="image"  src="image/portal/u4.png"/></td>
		</tr>
	</table>
	</form>
	<div id="end"></div>
 </body>
 </html>