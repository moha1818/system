<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>店铺名审核</title>
<style type="text/css">
.XYTipsWindow .boxTitle, .XYTipsWindow .boxTitle span, .XYTipsWindow .boxTitle span.hover, .XYTipsWindow .loadinglayer, .XYTipsWindow .tipslayer, .XYTipsWindow .arrowLeft, .XYTipsWindow .colseBtn, .XYTipsWindow .boxError em, .XYTipsWindow .dialogBtn, .XYTipsWindow .dialogBtn.hover { background-image: url("image/ico.png"); background-repeat: no-repeat; }
.XYTipsWindow .boxTitle { position: relative; border: 1px solid #A6C9E1; border-bottom: none; background-position: 0 0; background-repeat: repeat-x; height: 30px; line-height: 30px; }
.XYTipsWindow .boxTitle h3 { float: left; font-weight: normal; color: #666; font-size: 14px; margin: 0; text-indent: 10px; cursor: default;}
.XYTipsWindow .boxTitle span { position: absolute; width: 10px; background-position: -80px -40px; text-indent: -10em; right: 10px; top: 10px; height: 16px; overflow: hidden; cursor: pointer; }
.XYTipsWindow .boxTitle span.hover { background-position: -90px -40px; }
</style>
<link href="css/system management/keywordsre.css" type="text/css" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery.XYTipsWindow.min.2.8.js"></script>
	<script src="dist/js/zui.js"></script>
<script type="text/javascript">
$(function(){
	var page='<s:property value="pageIndex"/>';
	if(page==""){
		page=1;
	}
	$(".page").eq(page-1).addClass("pagecss");
	});
	
function get(a){
	var value = $(a).val();
	var name = $(a).next(':input').val();
	var cusName=$(a).next().next(':input').val();
	var cusId=$(a).next().next().next(':input').val();
	var pageIndex = "<s:property value='pageIndex'/>";
	var keywordName = "<s:property value='keywordName'/>";
	if(value==5){
		$.XYTipsWindow({
			___title:"当前为【"+name+"】进行续费操作",
			___content:"iframe:showKey2?keywordName="+name,
			___width:"480",
			___height:"260",
			___drag:"___boxTitle"
		});
	}else if(value==0){
		location.href="keywordsCheck?pageIndex="+pageIndex+"&keywordName="+keywordName;
	 }else {
		$.ajax({
			url:'msgOut',
			type:'get',
			data:'value='+value+"&keyname="+name+"&cusName="+cusName,
			dataType:'json',
			success:function(data){
				if (confirm(data.msg1)){
					$.ajax({
						url:'check',
						type:'get',
						data:'value='+value+"&keyname="+name+"&cusName="+cusName+"&cusId="+cusId,
						dataType:'json',
						success:function(data){
							alert(data.msg2);
							location.href="keywordsCheck?pageIndex="+pageIndex+"&keywordName="+keywordName;
							}		
						});
					} else {
						location.href="keywordsCheck?pageIndex="+pageIndex+"&keywordName="+keywordName;
						return false;
					}
				
					}		
			});
		
		
	}
}

</script>
 </head>
 <body>
  <div id="" class="">
		<h3 id="h3">店铺名审核</h3>
		<form class="top" action="keywordsCheck" method="get" >
			店铺名：<s:textfield name="keywordName" />
			<input type="submit" class="btn btn-primary submit" value="查询">
			<%--<span class="green">审核流程：已申请(代理商申请)》审核中》通过》续费</span>&nbsp;|&nbsp;<span class="red">审核流程：已申请(代理商申请)》审核中》不通过</span>
		--%></form>
		<div id="" class="">
			<table class="table table-hover table-bordered">
			<tr class="title">
				<td>序号</td>
				<td>店铺名</td>
				<td>客户名称</td>
				<td>操作员</td>
				<td>申请年限</td>
				<td>申请日期</td>
				<td>到期日期</td>
				<td>申请到期状态</td>
				<td>审核状态</td>
				<td>使用状态</td>
				<td>操作</td>
			</tr>
	 <s:iterator value="keywords" var="k" status="status">
     <tr>
		<td><s:property value="#status.index+1"/></td>        
        <td><s:property value="#k.keywords"/></td>
        <td><s:property value="#k.customName"/></td>	
        <td><s:property value="#k.agentName"/></td>        
        <td><s:property value="#k.serviceYears"/></td>
        <td><s:date name="#k.regDatetime"/></td>
        <td><s:date name="#k.regPassDatetime"/></td>	
        <td>
        	<s:if test="#k.isPass==0"><span style="color:#008000">未过期</span></s:if>
        	<s:if test="#k.isPass==1"><span style="color:#FF0000">预注册过期</span></s:if>
        	<s:if test="#k.isPass==2"><span style="color:#FF0000">正式注册过期</span></s:if>
        </td>        
        <td>
        	<s:if test="#k.checkStatus==0"><span style="color:#008000">已申请</span></s:if>
        	<s:if test="#k.checkStatus==1"><span style="color:#008000">审核中</span></s:if>
        	<s:if test="#k.checkStatus==2"><span style="color:#008000">已通过</span></s:if>
        	<s:if test="#k.checkStatus==3"><span style="color:#FF0000">未通过</span></s:if>
        </td>
        <td>
        	<s:if test="#k.isUse==0"><span style="color:#FF0000">未使用</span></s:if>
        	<s:if test="#k.isUse==1"><span style="color:#008000">已使用</span></s:if>
		</td>
		<td>
			<s:if test="#k.checkStatus==3">
				<span style="color:#D3CCCC">无操作</span>
			</s:if>
			<s:if test="#k.isUse==0">
				<s:select list="#{'1':'使用'}" onchange="get(this)" headerKey="0" headerValue="—请选择—"/>
			</s:if>
			<s:if test="#k.isUse==1&&#k.checkStatus==0">
				<s:select list="#{'2':'审核中','6':'不使用'}" onchange="get(this)" headerKey="0" headerValue="—请选择—"/>
			</s:if>
			<s:if test="#k.isUse==1&&#k.checkStatus==1">
				<s:select list="#{'3':'审核通过','4':'不通过','6':'不使用'}" onchange="get(this)" headerKey="0" headerValue="—请选择—"/>
			</s:if>
			<s:if test="#k.isUse==1&&#k.checkStatus==2">
				<s:select list="#{'5':'续费','6':'不使用'}" onchange="get(this)" headerKey="0" headerValue="—请选择—"/>
			</s:if>
			<input type="hidden" value="<s:property value='#k.keywords'/>">
			<input type="hidden" value="<s:property value='#k.customName'/>">
			<input type="hidden" value="<s:property value='#k.customId'/>">
		</td>
    </tr> 
    </s:iterator> 
			</table>
		 <div id="pager">
			<ul>
			<li><a href="keywordsCheck?pageIndex=1&keywordName=<s:property value="keywordName"/>">首页</a></li>
			<s:iterator var="i" begin="1" end="totalPage">
				<li class="page"><a href="keywordsCheck?pageIndex=<s:property value="i"/>&keywordName=<s:property value="keywordName"/>"><s:property value="i"/></a></li>
			</s:iterator>
			<li><a href="keywordsCheck?pageIndex=<s:property value="totalPage"/>&keywordName=<s:property value="keywordName"/>">尾页</a></li>
			</ul>
		 </div>
		</div>
		<div style="height:150px;">
		</div>
  </div>
 </body>
</html>