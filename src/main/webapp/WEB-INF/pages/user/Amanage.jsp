<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
    <link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
    <link type="text/css" rel="stylesheet" href="dist/lib/dashboard/zui.dashboard.css" />
<style>
body{
	font-size:14px;
	}
.bordered{
	margin:40px;
	border:none;
	}
p{
	padding:0px 10px;}
p a{
	text-decoration:none;}
</style>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="dist/js/zui.js"></script>
    <script type="text/javascript" src="dist/lib/dashboard/zui.dashboard.js"></script>
<script type="text/javascript">
$(function(){
$('#detail').click(function(){
	$(window.parent.document).find('#n3').html('&#92;&nbsp;查看账户明细');
})
    $('#dashboard').dashboard({draggable: true});
})
</script>
</head>

<body>

<%--<div  class="bordered ">
<p><span style="font-weight:bold">您好，<s:property value="#session.user.userName"/>!&nbsp;&nbsp;</span>您上次登录时间为：<s:date name="lastLoginT"/></p>
<p>您当前账户余额：￥<s:number name="account.money"/> <a href="showDetail" id="detail">查看账户明细</a></p>
</div>--%>
<div id="dashboard" class="bordered dashboard dashboard-draggable" data-height="380">
    <section class="row">
        <div class="col-md-4 col-sm-6">
            <div class="panel" data-id="1">
                <div class="panel-heading">
                    <i class="icon icon-list"></i>
                    <span class="title">登录信息</span>
                </div>
                <div class="panel-body">
                    <p><span style="font-weight:bold">您好，${sessionScope.user.userName}!&nbsp;&nbsp;</span>您上次登录时间为：${lastLoginT}</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6">
            <div class="panel" data-id="2">
                <div class="panel-heading">
                    <i class="icon icon-bullhorn"></i>
                    <span class="title">最新动态</span>
                    <div class="panel-actions pull-right">
                        <a href="loglist" style="color: #353535;">更多<i class="icon icon-double-angle-right"></i></a>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>用户名称</th>
                        <th>操作信息</th>
                        <th>操作时间</th>
                    </tr>
                    </thead>
                    <s:forEach items="${logs}" var="list">
                        <tr>
                            <td>${list.userName}</td>
                            <td>${list.operateInfo}</td>
                            <td>${list.operateDatetime}</td>
                        </tr>
                    </s:forEach>
                </table>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="panel" data-id="3">
                <div class="panel-heading">
                    <i class="icon icon-calendar"></i>
                    <span class="title">任务事项</span>
                </div>
                <div class="panel-body no-padding">
                    <div class="list-group">
                        <a href="keywordsCheck" class="list-group-item">待审核<span class="label label-badge label-info">${passStatus.authKeys}</span></a>
                        <a href="keywordsCheck" class="list-group-item">审核中<span class="label label-badge label-primary">${passStatus.authingKeys}</span></a>
                        <a href="keywordsCheck" class="list-group-item">审核通过<span class="label label-success label-badge ">${passStatus.passedKeys}</span></a>
                        <a href="keywordsCheck" class="list-group-item">审核不通过<span class="label label-badge label-danger">${passStatus.noPassedKeys}</span></a>
                        <a href="keywordsCheck" class="list-group-item">过期 <span class="label label-badge ">${passStatus.uselessKeys}</span></a>
                        <a href="keywordsCheck" class="list-group-item">总审核数<span class="label label-badge label-warning">${passStatus.keywords}</span></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%--<div class="panel">
    <div class="panel-heading">
        <i class="icon icon-bullhorn"></i>&nbsp;&nbsp;最新动态
    </div>
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>用户名称</th>
            <th>操作信息</th>
            <th>操作时间</th>
        </tr>
        </thead>
        <s:iterator value="logs" status="n"  begin="0" end="7">
            <tr>
                <td><s:property value="userName" /></td>
                <td><s:property value="operateInfo" /></td>
                <td><s:date name="operateDatetime" format="yyyy-MM-dd hh:mm:ss" /></td>
            </tr>
        </s:iterator>
    </table>
</div>--%>
</body>
</html>