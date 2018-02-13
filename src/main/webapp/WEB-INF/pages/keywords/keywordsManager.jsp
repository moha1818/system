<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/agentmanage/2.css">
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery.XYTipsWindow.min.2.8.js"></script>

<script type="text/javascript">
	$(function() {
		var page = '<s:property value="#parameters.pageIndex"/>';
		if (page == "") {
			page = 1;
		}
		var x = $(".page").text();
		for (i = 0; i < x.length; i++) {
			if ($(".page").eq(i).text() == page) {
				$(".page").eq(i).addClass("pagecss");
			}
		}
	});
</script>
</head>

<body class="normal">
	<form action="keywordsList" method="get">
		<div>
			店铺名：
			<s:textfield name="keywordName" />
			<input type="submit" class="btn btn-primary btn-mini sub" value="查询">
		</div>
	</form>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>序号</th>
				<th>店铺名</th>
				<th>客户名称</th>
				<th>操作员</th>
				<th>申请年限</th>
				<th>申请日期</th>
				<th>到期日期</th>
				<th>申请到期状态</th>
				<th>审核状态</th>
				<th>使用状态</th>
				<th>手机端开通状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<s:iterator value="keywords" var="k" status="status">
			<tr>
				<td><s:property value="#status.index+1" /></td>
				<td><s:property value="#k.keywords" /></td>
				<td><s:property value="#k.customName" /></td>
				<td><s:property value="#k.agentName" /></td>
				<td><s:property value="#k.serviceYears" /></td>
				<td><s:date name="#k.regDatetime" /></td>
				<td><s:date name="#k.regPassDatetime" /></td>
				<td><s:if test="#k.isPass==0">
						<span style="color: #008000">未过期</span>
					</s:if> <s:if test="#k.isPass==1">
						<span style="color: #FF0000">预注册过期</span>
					</s:if> <s:if test="#k.isPass==2">
						<span style="color: #FF0000">正式注册过期</span>
					</s:if></td>
				<td><s:if test="#k.checkStatus==0">
						<span style="color: #008000">已申请</span>
					</s:if> <s:if test="#k.checkStatus==1">
						<span style="color: #008000">审核中</span>
					</s:if> <s:if test="#k.checkStatus==2">
						<span style="color: #008000">已通过</span>
					</s:if> <s:if test="#k.checkStatus==3">
						<span style="color: #FF0000">未通过</span>
					</s:if></td>
				<td><s:if test="#k.isUse==0">
						<span style="color: #FF0000">未使用</span>
					</s:if> <s:if test="#k.isUse==1">
						<span style="color: #008000">已使用</span>
					</s:if></td>
				<td><s:if test="#k.openApp==0">
						<span style="color: #FF0000">未开通</span>
					</s:if> <s:if test="#k.openApp==1">
						<span style="color: #008000">已开通</span>
					</s:if></td>
				<td><input type="hidden" value="<s:property value="#k.keywords" />" id="keyword">
					<s:if test="#k.checkStatus==2&&#k.openApp==0">
					<a href="javascript:void(0);"
					   class="btn btn-primary btn-mini openApp">开通手机端详情</a>
						<a href="javascript:void(0);" class="btn btn-primary btn-mini renew">续费</a>
						<input type="hidden" value="<s:property value="#k.customName"/>" />
					</s:if> <s:if test="#k.checkStatus==2&&#k.openApp==1">
						<a href="javascript:void(0);" class="btn btn-primary btn-mini renew">续费</a>
						<input type="hidden" value="<s:property value="#k.customName"/>" />
					</s:if> <s:if test="#k.checkStatus!=2">
						<span style="color: #D3CCCC">无操作</span>
					</s:if></td>
			</tr>
		</s:iterator>
	</table>

	<div id="pager">
		<ul>
			<li><a
				href="keywordsList?pageIndex=1&keywordName=<s:property value="keywordName"/>">首页</a></li>
			<s:if test="pageIndex!=1">
				<li style="width: 30px;"><a style="width: 30px;"
					href="keywordsList?pageIndex=<s:property value="pageIndex-1"/>&keywordName=<s:property value="keywordName"/>">〈</a></li>
			</s:if>
			
			<s:if test="totalPage<8">
				<s:iterator begin="1" end="totalPage" var="i">
					<li class="page"><a
					href="keywordsList?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>"><s:property
							value="i" /></a></li>
				</s:iterator>
			</s:if>
			<s:else>
			<s:if test="pageIndex-4<=0">
				<s:iterator begin="1" end="8" var="i">
					<li class="page"><a
					href="keywordsList?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>"><s:property
							value="i" /></a></li>
				</s:iterator>
			</s:if>
			<s:if test="pageIndex-pageIndex<=4">
				<s:iterator begin="totalPage-7" end="totalPage" var="i">
					<li class="page"><a
					href="keywordsList?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>"><s:property
							value="i" /></a></li>
				</s:iterator>
			</s:if>
			<s:if test="pageIndex-4>0 &&pageIndex-pageIndex>4">
				<s:iterator begin="pageIndex-3" end="pageIndex+4" var="i">
					<li class="page"><a
					href="keywordsList?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>"><s:property
							value="i" /></a></li>
				</s:iterator>
			</s:if>
			</s:else>
			<s:if test="pageIndex!=totalPage">
				<li style="width: 30px;"><a style="width: 30px;"
					href="keywordsList?pageIndex=<s:property value="pageIndex+1"/>&keywordName=<s:property value="keywordName"/>">〉</a></li>
			</s:if>
			<li><a
				href="keywordsList?pageIndex=<s:property value="totalPage"/>&keywordName=<s:property value="keywordName"/>">尾页</a></li>
		</ul>
	</div>

	<div style="height: 170px;"></div>
</body>
</html>