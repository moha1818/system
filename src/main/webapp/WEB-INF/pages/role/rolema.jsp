<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<link href="css/system management/rolema.css" type="text/css"
	rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/system management/rolema.js"></script>
</head>
<body>
	<div id="" class="">
		<div id="" class=" add">
			<a href="javascript:;" class="btn btn-primary" ><i class="icon icon-plus-sign"></i>添加</a>
		</div>
		<div id="" class="">
			<table class="table table-hover table-bordered all">
				<tr class="title">
					<td>角色名称</td>
					<td>创建时间</td>
					<td>是否启用</td>
					<td>操作</td>
				</tr>
				<s:iterator value="rolemalist" var="list">
					<tr>
						<td><s:property value="#list.roleName" /></td>
						<td><s:date name="#list.creationTime"
								format="yyyy-MM-dd HH:mm:ss" /></td>
						<td><s:if test="#list.isStart==1">启动</s:if> <s:if
								test="#list.isStart==0">不启动</s:if></td>
						<td><a href="#" class="modify1"
							onclick="javascript:aa(<s:property value="#list.id" />)">修改</a>&nbsp;|&nbsp;<a
							href="delRole?id=<s:property value="#list.id" />" class="delete">删除</a></td>
					</tr>
				</s:iterator>
			</table>
		</div>
		<div class="adduser" style="display: none">
			<span class="title2">添加角色信息</span>
			<hr />
			<s:form action="addRole" method="post">
				<table>
					<tr>
						<td>角色名称</td>
						<td><s:textfield name="roleName" id="roleName1" /></td>
					</tr>
					<tr>
						<td>是否启用</td>
						<td><s:select name="isStart" list="#{'1':'启动','0':'不启动'}"
								id="tishi1" /> <span class="red"></span></td>
					</tr>
					<tr>
						<td><s:submit type="image"
								src="image/role authorization/save.jpg" id="tijiao1" onclick="return tijiao1()"/>
						<td><s:submit type="image"
								src="image/role authorization/cancel.jpg" class="cancel1"
								onclick="return false" /></td>
					</tr>
				</table>
			</s:form>
		</div>
		<div class="modify" style="display: none">
			<span class="title2">修改角色信息</span>
			<hr />
			<s:form id="action" method="post">
				<table>
					<tr>
						<td>角色名称</td>
						<td><s:textfield name="roleName" id="roleName2" /></td>
					</tr>
					<tr>
						<td>是否启用</td>
						<td><s:select name="isStart" list="#{'1':'启动','0':'不启动'}"
								id="tishi2" /><span class="red"></span></td>
					</tr>

					<tr>
						<td><s:submit type="image"
								src="image/role authorization/save.jpg" id="tijiao2"
								onclick="return tijiao2()" />
						<td><s:submit type="image"
								src="image/role authorization/cancel.jpg" class="cancel2"
								onclick="return false" /></td>
					</tr>
				</table>
			</s:form>
		</div>
		<div style="height: 70px;"></div>
	</div>
</body>
</html>