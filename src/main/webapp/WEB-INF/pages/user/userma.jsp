<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
  <link href="css/system management/userma.css" type="text/css" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="js/system management/userma.js" ></script>
  <script type="text/javascript" src="js/jquery.XYTipsWindow.min.2.8.js"></script>
  <script type="text/javascript">
  $(function(){
		var page='<s:property value="page.pageIndex"/>';
		if(page==""){
			page=1;
		}
		$(".page").eq(page-1).addClass("pagecss");
		});
  </script>
 </head>
 <body>
  <div id="">
	<form action="userma" method="get" >
		<div class="top">
		用户名称：<s:textfield name="userName"/>
		角色：<s:select name="roleid" list="rolemalist" listKey="id" listValue="roleName" headerKey="" headerValue="—请选择—"/>
		是否启用：<s:select name="isStart" list="#{'1':'启动','0':'不启动'}" headerKey="2" headerValue="—请选择—"/>
		<s:submit type="image" src="image/user management/u5.png" id="chaxun" /> 
		</div>
	<div id="" class="middle">
		<input class="middle1" type="image" src="image/user management/u7.png" width="115" height="33" border="0" onclick="return false" />
	</div>
	<div id="" class="">
		<table  class="table table-hover table-bordered all">
			<tr class="title">
				<td>登录帐号</td>
				<td>用户名称</td>
				<td>角色</td>
				<td>创建时间</td>
				<td>是否启用</td>
				<td>操作</td>
			</tr>
			<s:if test="userlist.size()!=0">
			<s:iterator value="userlist" var="list">
			<tr>
				<td class="userCode"><s:property value="#list.userCode" /></td>
				<td class="userName"><s:property value="#list.userName" /></td>
				<td><s:property value="#list.role.roleName"/></td>
				<td><s:date name="#list.creationTime" format="yyyy-MM-dd HH:mm:ss"/></td>
				<td><s:if test="#list.isStart==1">启动</s:if>
					<s:if test="#list.isStart==0">不启动</s:if></td>
				<td><a href="#" class="modify1"  onclick="some(this)">修改</a>&nbsp;|&nbsp;<a href="delUser?id=<s:property value="#list.id" />" class="delete">删除</a>&nbsp;|&nbsp;<a href="javascript:void(0);" class="pre">预付款</a>&nbsp;|&nbsp;<a href="javascript:void(0);" class="log">LOG日志</a></td>				
			</tr>
			<input type="hidden" value="<s:property value="#list.id"/>"/>
			</s:iterator>
			</s:if>
			<s:if test="userlist.size()==0">
			<tr>
				<td colspan="6">没有这种用户</td>
			</tr>
			</s:if>
		</table>
		<ul id="pager">
			<a href="userma?page.pageIndex=1&userName=<s:property value="userName"/>&roleid=<s:property value="roleid"/>&isStart=<s:property value="isStart"/>"><li class="begin">首页</li></a>
			<s:iterator begin="1" end="page.pageCount" status="index">
			<a href="userma?page.pageIndex=<s:property value="#index.index+1"/>&userName=<s:property value="userName"/>&roleid=<s:property value="roleid"/>&isStart=<s:property value="isStart"/>"><li class="page"><s:property value="#index.index+1"/></li></a>
			</s:iterator>
			<a href="userma?page.pageIndex=<s:property value="page.pageCount"/>&userName=<s:property value="userName"/>&roleid=<s:property value="roleid"/>&isStart=<s:property value="isStart"/>"><li class="end">尾页</li></a>
		</ul>
	</div>
	</form>
	<div class="adduser" style="display:none">
		<span class="title2">添加用户信息</span><hr />
		<s:form action="addUser" method="post">
		<table>
		<tr>
			<td>登录帐号：</td>
			<td><s:textfield name="userCode" class="userCode" id="userCode1"/><span class="default"></span></td>
		</tr>
		<tr>
			<td>用户名称：</td>
			<td><s:textfield name="userName" class="userName" id="userName1"/><span class="default"></span></td>
		</tr>
		<tr>
			<td>登录密码：</td>
			<td><s:password name="userPassword" showPassword="123456" value="123456" id="userPassword1"/><span class="default">默认密码为123456</span></td>
		</tr>
		<tr>
			<td>角色：</td>
			<td>
				<s:select id="roleid1" name="roleid" list="rolemalist" listKey="id" listValue="roleName" headerKey="" headerValue="—请选择—"/>
			</td>
		</tr>
		<tr>
			<td>是否启用：</td>
			<td>
				<s:select name="isStart" list="#{'1':'启动','0':'不启动'}"/>
			</td>
		</tr>
		<tr>			
			<td><s:submit type="image" src="image/role authorization/save.jpg" id="tijiao1" onclick="return tijiao1()"/> </td>
			<td><s:submit type="image" src="image/role authorization/cancel.jpg" class="cancel1" onclick="return false" />
		</tr>
		</table>
		</s:form>		
	</div>
	<div class="modify" style="display:none">
		<span class="title2">修改用户信息</span><hr />
		<s:form id="action"  method="post">
		<table>
		<tr>
			<td>登录帐号：</td>
			<td><s:textfield name="userCode" id="mouserCode" class="userCode"/><span class="default"></span></td>
		</tr>
		<tr>
			<td>用户名称：</td>
			<td><s:textfield name="userName" id="mouserName" class="userName"/><span class="default"></span></td>
		</tr>
		<tr>
			<td>登录密码：</td>
			<td><s:password name="userPassword" showPassword="" value="" id="moPassword"/><span class="default">默认密码为123456</span></td>
		</tr>
		<tr>
			<td>角色：</td>
			<td>
				<s:select name="roleid" list="rolemalist" listKey="id" listValue="roleName" headerKey="" headerValue="—请选择—" id="moroleid"/>
			</td>
		</tr>
		<tr>
			<td>是否启用：</td>
			<td>
				<s:select name="isStart" list="#{'1':'启动','0':'不启动'}" id="moisStart"/>
			</td>
		</tr>
		<tr>			
			<td><s:submit type="image" src="image/role authorization/save.jpg" id="tijiao2" onclick="return tijiao2()"/> </td>
			<td><s:submit type="image" src="image/role authorization/cancel.jpg" class="cancel2" onclick="return false" />
		</tr>
		</table>
		</s:form>		
	</div>
	
	<div style="height:370px;">
		
	</div>
  </div>
 </body>
</html>