<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/agentmanage/2.css">
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
<script type="text/javascript" src="js/laydate.js"></script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script src="dist/js/zui.js"></script>
<script type="text/javascript">
$(function() {
	var page = '<s:property value="#parameters.pageIndex"/>';
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

<body class="normal">
	<form action="prepay" method="get">
		<div>
			<span>操作类型：</span>
			<s:select id="u2_input" name="detailType" list="config"
				listKey="configTypeValue" listValue="configTypeName"></s:select>
			操作时间：
			<s:textfield class="laydate-icon" id="demo" name="starttime" />
			至
			<s:textfield class="laydate-icon" id="demo1" name="endtime" />
			<input type="hidden" value="<s:property value="id"/>" name="id">
			<a class="btn btn-primary btn-mini sub" href="javascript:void(0);">查询</a>
			
		</div>
	</form>

	<table class="table table-hover table-bordered">
		<thead>

			<tr>
				<th>序号</th>
				<th>账户类型</th>
				<th>账务资金</th>
				<th>备注信息</th>
				<th>明细时间</th>
			</tr>
		</thead>
		<s:iterator value="detail" var="detail" status="s">
			<tr>
				<td><s:number name="#detail.id" /></td>
				<td><s:property value="#detail.detailTypeName" /></td>
				<td><s:number name="#detail.money" /></td>
				<td><s:property value="#detail.memo" /></td>
				<td><s:date name="#detail.detailDateTime" /></td>
			</tr>
		</s:iterator>
	</table>
	<div id="pager">
		<ul>
			<li><a
				href="prepay?pageIndex=1&detailType=<s:property value="detailType"/>&starttime=<s:property value="starttime"/>&endtime=<s:property value="endtime"/>&id=<s:property value="id"/>">首页</a></li>
			<s:if test="pageIndex!=1">
				<li style="width: 30px;"><a style="width: 30px;"
					href="prepay?pageIndex=<s:property value="pageIndex-1"/>&detailType=<s:property value="detailType"/>&starttime=<s:property value="starttime"/>&endtime=<s:property value="endtime"/>&id=<s:property value="id"/>">〈</a></li>
			</s:if>
			
			<s:if test="totalPage<8">
				<s:iterator begin="1" end="totalPage" var="i">
					<li class="page"><a
					href="prepay?pageIndex=<s:property value="i"/>&detailType=<s:property value="detailType"/>&starttime=<s:property value="starttime"/>&endtime=<s:property value="endtime"/>&id=<s:property value="id"/>"><s:property
							value="i" /></a></li>
				</s:iterator>
			</s:if>
			
			<s:else>
			<s:if test="pageIndex-4<=0">
				<s:iterator begin="1" end="8" var="i">
					<li class="page"><a
					href="prepay?pageIndex=<s:property value="i"/>&detailType=<s:property value="detailType"/>&starttime=<s:property value="starttime"/>&endtime=<s:property value="endtime"/>&id=<s:property value="id"/>"><s:property
							value="i" /></a></li>
				</s:iterator>
			</s:if>
			<s:if test="totalPage-pageIndex<=4">
				<s:iterator begin="totalPage-7" end="totalPage" var="i">
					<li class="page"><a
					href="prepay?pageIndex=<s:property value="i"/>&detailType=<s:property value="detailType"/>&starttime=<s:property value="starttime"/>&endtime=<s:property value="endtime"/>&id=<s:property value="id"/>"><s:property
							value="i" /></a></li>
				</s:iterator>
			</s:if>
			<s:if test="pageIndex-4>0 &&totalPage-pageIndex>4">
				<s:iterator begin="pageIndex-3" end="pageIndex+4" var="i">
					<li class="page"><a
					href="prepay?pageIndex=<s:property value="i"/>&detailType=<s:property value="detailType"/>&starttime=<s:property value="starttime"/>&endtime=<s:property value="endtime"/>&id=<s:property value="id"/>"><s:property
							value="i" /></a></li>
				</s:iterator>
			</s:if>
			</s:else>
			
			<s:if test="pageIndex!=totalPage">
				<li style="width: 30px;"><a style="width: 30px;"
					href="prepay?pageIndex=<s:property value="pageIndex+1"/>&detailType=<s:property value="detailType"/>&starttime=<s:property value="starttime"/>&endtime=<s:property value="endtime"/>&id=<s:property value="id"/>">〉</a></li>
			</s:if>
			<li><a
				href="prepay?pageIndex=<s:property value="totalPage"/>&detailType=<s:property value="detailType"/>&starttime=<s:property value="starttime"/>&endtime=<s:property value="endtime"/>&id=<s:property value="id"/>">尾页</a></li>
		</ul>
	</div>
	<div style="height: 250px;"></div>
	<script type="text/javascript" src="js/laydate-2.js"></script>
</body>
</html>