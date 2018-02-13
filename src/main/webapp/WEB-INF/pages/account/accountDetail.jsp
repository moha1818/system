<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/agentmanage/2.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var page='<s:property value="pageIndex"/>';
	if(page==""){
		page=1;
	}
	$(".page").eq(page-1).addClass("pagecss");
	});
</script>
</head>

<body>
<table class="bordered">
    <thead>

    <tr>
        <th>序号</th>        
        <th>账户类型</th>
        <th>账务资金</th>
        <th>账户余额</th>
        <th>备注信息</th>
        <th>明细时间</th>
    </tr>
    </thead>
    <s:iterator value="detail" var="detail" status="status">
     <tr>
		<td><s:property value="#status.index+1"/></td>        
        <td><s:property value="#detail.detailTypeName"/></td>
        <td><s:number name="#detail.money"/></td>	
        <td><s:number name="#detail.accountMoney"/></td>        
        <td><s:property value="#detail.memo"/></td>
        <td><s:date name="#detail.detailDateTime"/></td>
    </tr>	
    </s:iterator>
           
</table>
<div id="pager">
<ul>
<li><a href="showDetail?pageIndex=1">首页</a></li>
<s:iterator var="i" begin="1" end="totalPage">
	<li class="page"><a href="showDetail?pageIndex=<s:property value="i"/>"><s:property value="i"/></a></li>
</s:iterator>
<li><a href="showDetail?pageIndex=<s:property value="totalPage"/>">尾页</a></li>
</ul>
</div>
<div style="height:170px;"></div>
</body>
</html>