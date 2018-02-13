<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品分类数量/金额汇总</title>
<link href="css/report.css" type="text/css" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
	<script src="dist/js/zui.js"></script>
</head>
<body>
<s:include value="top.jsp"></s:include>
<h1>产品分类数量/金额汇总</h1>
<div id="download"><a href="exportExcel?reportType=<s:property value="reportType"/>"><img alt="EXCLE下载" src="image/report/u7.png"></a></div>
			<table class="table table-hover table-bordered">
			<tr class="title">
				<td>序号</td>
				<td>产品分类名称</td>
				<td>数量</td>
				<td>价格</td>
			</tr>
			<s:iterator value="product" var="product" status="status">
			<tr>
				<td><s:property value="#status.index+1"/></td>
				<td><s:property value="#product.typeName"/></td>
				<td><s:number name="#product.count"/></td>
				<td><s:number name="#product.money"/></td>
			</tr>
			</s:iterator>
			</table>
		<div id="foot"></div>
</body>
</html>