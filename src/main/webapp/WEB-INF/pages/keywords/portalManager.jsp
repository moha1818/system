<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>门户管理</title>
<link href="css/portal/portalManager.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	$(window.parent.document).find('#n3').html('');
}

$(function(){
	$('#see').click(function(){
		$(window.parent.document).find('#n3').html('&#92;&nbsp;查看门户信息');
	})
	$('#upd').click(function(){
	$(window.parent.document).find('#n3').html('&#92;&nbsp;修改门户信息');
	})
	
	var page='<s:property value="pageIndex"/>';
	if(page==""){
		page=1;
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

<body>
<form class="top" action="getPortal" method="get">
			关键词：<input name="keywordName" type="text"/>
			客户名称：<input name="customName" type="text"/>
			<input class="submit" type="image" src="image/keywords review/u3.png" 
			width="54" 	height="22" border="0"/>
</form>
			<table width="980px" border="1" cellpadding="0" cellspacing="0">
			<tr class="title">
				<td>序号</td>
				<td>门户名称</td>
				<td>客户名称</td>
				<td>法人代表</td>
				<td>代理商</td>
				<td>注册日期</td>
				<td>类型</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<s:iterator value="keywords" var="k" status="status">
			<tr>
				<td><s:property value="#status.index+1"/></td>
				<td><s:property value="#k.keywords"/></td>
				<td><s:property value="#k.customName"/></td>
				<td><s:property value="#k.customs.bossName"/></td>
				<td><s:property value="#k.agentName"/></td>
				<td><s:date name="#k.customs.regDatetime"/></td>
				<td><s:property value="#k.customs.customTypeName"/></td>
				<td>
					<s:if test="#k.isUse==1">
						已使用
					</s:if>
					<s:if test="#k.isUse==0">
						未使用
					</s:if>
				</td>
				<td><a href="portalView?kid=<s:property value='#k.id'/>" id="see">查看</a>/<a href="portalModify?kid=<s:property value='#k.id'/>" id="upd">修改</a></td>
			</tr>	
			</s:iterator>
			<tr><s:property value="msg"/></tr>
			</table>
		<div id="pager">
		<ul>
			<li><a href="getPortal?pageIndex=1&keywordName=<s:property value="keywordName"/>&customName=<s:property value="customName"/>">首页</a></li>
			<s:if test="pageIndex!=1">
				<li style="width: 30px;"><a style="width: 30px;"
					href="getPortal?pageIndex=<s:property value="pageIndex-1"/>&keywordName=<s:property value="keywordName"/>&customName=<s:property value="customName"/>">〈</a></li>
			</s:if>
			<s:if test="totalPage<8">
				<s:iterator begin="1" end="totalPage" var="i">
					<li class="page"><a
						href="getPortal?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>&customName=<s:property value="customName"/>"><s:property
								value="i" /></a></li>
				</s:iterator>
			</s:if>
			<s:else>
			<s:if test="pageIndex-4<=0">
				<s:iterator begin="1" end="8" var="n">
					<li class="page"><a
						href="getPortal?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>&customName=<s:property value="customName"/>"><s:property
								value="n" /></a></li>
				</s:iterator>
			</s:if>
			<s:if test="totalPage-pageIndex<=4">
				<s:iterator begin="totalPage-7" end="totalPage" var="i">
					<li class="page"><a
						href="getPortal?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>&customName=<s:property value="customName"/>"><s:property
								value="i" /></a></li>
				</s:iterator>
			</s:if>
			<s:if test="pageIndex-4>0 &&totalPage-pageIndex>4">
				<s:iterator begin="pageIndex-3" end="pageIndex+4" var="i">
					<li class="page"><a
						href="getPortal?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>&customName=<s:property value="customName"/>"><s:property
								value="i" /></a></li>
				</s:iterator>
			</s:if>
			</s:else>
			
			<s:if test="pageIndex!=totalPage">
				<li style="width: 30px;"><a style="width: 30px;"
					href="getPortal?pageIndex=<s:property value="pageIndex+1"/>">〉</a></li>
			</s:if>
			<li><a href="getPortal?pageIndex=<s:property value="totalPage"/>&keywordName=<s:property value="keywordName"/>&customName=<s:property value="customName"/>">尾页</a></li>
		</ul>
		</div>
		<div id="foot"></div>
</body>
</html>