<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>功能列表</title>
<link href="css/system management/featurelist.css" type="text/css"
	rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
 <script type="text/javascript" src="js/system management/featurelist.js" ></script>
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
</head>
<body>
	<div id="" class="">
		<h2>功能列表</h2>
		<hr />
	</div>
	<s:form action="permission" method="post">
	<div id="" class="middle">
		<s:submit type="image" src="image/role authorization/save.jpg" id="tijiao"/>
		<input type="hidden" name="roleid" value="<s:property value="roleid" />"/>
		<input type="image"
			src="image/role authorization/cancel.jpg" width="53" height="20"
			border="0" />
	</div>
	<div id="" class="">
		<table class="table table-hover table-bordered" >
			<tr class="title">
				<td><input type="checkbox"  onclick="if(this.checked==true) { checkAll('permission'); } else { clearAll('permission'); }">全选/全不选</td>
				<td>功能名称</td>
				<td>功能URL</td>
				<td>创建时间</td>
				<td>是否启用</td>
			</tr>
			<s:iterator value="featurelist" var="list">
				<tr>
					<td>
						<s:if test="role_premissions.contains(#list.id) ">
							<s:checkbox fieldValue="%{#list.id}" name="permission" value="true" class="checkChildren"/>
						</s:if>
						<s:else>
							<s:checkbox fieldValue="%{#list.id}" name="permission" value="false" class="checkChildren"/>
						</s:else>
					</td>							
					<td><s:property value="#list.functionName" /></td>
					<td><s:property value="#list.funcUrl" /></td>
					<td><s:date name="#list.creationTime"
							format="yyyy-MM-dd HH:mm:ss" /></td>
					<td>启动</td>
				</tr>
			</s:iterator>
		</table>
	</div>
	</s:form>
</body>
</html>
