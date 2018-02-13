<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/agentmanage/2.css">
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var page = '<s:property value="#parameters.current"/>';
		if (page == "") {
			page = 1;
		}
		var x=$(".page").text();
		for(i=0;i<x.length;i++){
			if($(".page").eq(i).text()==page){
				$(".page").eq(i).addClass("pagecss");
			}
		}
	});
</script>
</head>

<body id="logs">

	<table class="table table-hover table-bordered ">
		<thead>
			<tr>
				<th>序号</th>
				<th>用户名称</th>
				<th>操作信息</th>
				<th>操作时间</th>
			</tr>
		</thead>
		<s:iterator value="cusPage.list" status="n">
			<tr>
				<td><s:property value="#n.index+1" /></td>
				<td><s:property value="userName" /></td>
				<td><s:property value="operateInfo" /></td>
				<td><s:date name="operateDatetime" format="yyyy-MM-dd hh:mm:ss" /></td>
			</tr>
		</s:iterator>
	</table>
	<div id="pager">
		<ul>
			<li><a href="loglist?id=<s:property value="id"/>">首页</a></li>
			<!-- 前一页 -->
			<s:if test="current!=1">
				<li style="width: 30px;"><a style="width: 30px;"
					href="loglist?current=<s:property value="current-1"/>">〈</a></li>
			</s:if>
			
			<!-- 显示8页 -->
			<!--1. 总页数小于8页的时候 -->
			<s:if test="cusPage.pageCount<8">
				<s:iterator begin="1" end="cusPage.pageCount" var="n">
					<li class="page"><a
						href="loglist?current=<s:property value="n"/>"><s:property
								value="n" /></a></li>
				</s:iterator>
			</s:if>
			<!-- 2.总页数大于8页的时候 -->
			<s:else>
			<!-- 1 -->
			<s:if test="current-4<=0">
				<s:iterator begin="1" end="8" var="n">
					<li class="page"><a
						href="loglist?current=<s:property value="n"/>"><s:property
								value="n" /></a></li>
				</s:iterator>
			</s:if>
			<!-- 2 -->
			<s:if test="cusPage.pageCount-current<=4">
				<s:iterator begin="cusPage.pageCount-7" end="cusPage.pageCount" var="n">
					<li class="page"><a
						href="loglist?current=<s:property value="n"/>"><s:property
								value="n" /></a></li>
				</s:iterator>
			</s:if>
			<!-- 3 -->
			<s:if test="current-4>0 &&cusPage.pageCount-current>4">
				<s:iterator begin="current-3" end="current+4" var="n">
					<li class="page"><a
						href="loglist?current=<s:property value="n"/>"><s:property
								value="n" /></a></li>
				</s:iterator>
			</s:if>
			</s:else>
			
			<!-- 后一页 -->
			<s:if test="current!=cusPage.pageCount">
				<li style="width: 30px;"><a style="width: 30px;"
					href="loglist?current=<s:property value="current+1"/>">〉</a></li>
			</s:if>
			<li><a
				href="loglist?current=<s:property value="cusPage.pageCount"/>&id=<s:property value="id"/>">尾页</a></li>
		</ul>
	</div>
	<div style="height: 170px;"></div>
</body>
</html>
