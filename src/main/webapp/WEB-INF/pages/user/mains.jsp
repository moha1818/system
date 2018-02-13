<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台桌面</title>
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
	<link type="text/css" rel="stylesheet" href="css/static/metisMenu.min.css" />
	<link type="text/css" rel="stylesheet" href="css/static/H-ui.min.css" />
	<link type="text/css" rel="stylesheet" href="css/static/H-ui.admin.css" />
	<link type="text/css" rel="stylesheet" href="css/static/skin.css" />
	<link type="text/css" rel="stylesheet" href="css/static/iconfont.css" />
	<style>
		table{
			display:table;
		}
		table td{
			border:none;
		}
		.pwdmsg{
			color:red;
		}
		.copyrights{position: absolute;left: 0;top: 5px;width: 200px;padding-right:20px; z-index: 1;}
		.footer{position: absolute;bottom: 0;z-index: 3;width:100%;height:50px; background: #f9f9f9 ;border: 0;}
	</style>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="dist/js/zui.js"></script>
	<script type="text/javascript" src="js/mains.js"></script>
	<s:if test="msg2!=null">
	<script type="text/javascript">
        var msg2 = "${msg2}"
        alert(msg2);
	</script>
	</s:if>
</head>
<body>
<header class="Hui-header cl">
	<div class="copyrights">
		<a class="Hui-logo l" href="login"><img src="image/title.png" height="40"></a>
		<span class="Hui-subtitle l">V1.0</span>
	</div>
	<ul class="Hui-userbar">
		<li class="dropDown dropDown_hover"><a href="javascript:" class="dropDown_A">
			${sessionScope.user.userName}  <i class="icon icon-chevron-sign-down"></i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a id="btn-changepwd" type="button" data-toggle="modal" data-target="#saveTable">
					修改密码
				</a></li>

				<li><a id="out" href="/html/loginOut">退出</a></li>
			</ul>
		</li>
	</ul>
</header>
<aside class="Hui-aside sidebar">
	<nav class="menu" data-toggle="menu" style="width: 200px">
		<ul class="nav nav-primary">
			<li class="nav-parent"><a href="javascript:;"><i class="icon-list-ul"></i>企业管理</a>
				<ul class="nav" id="c_1">
					<li id="i2"><a href="pageList" target="inside">企业客户管理</a></li>
				</ul>
			</li>
			<li class="nav-parent"><a href="javascript:;"><i class="icon icon-sitemap"></i>企业店铺管理</a>
				<ul class="nav" id="c_2">
					<li id="i1"><a href="keywords_application" target="inside">店铺名申请</a></li>
					<li id="i10"><a href="keywordsCheck" target="inside">企业店铺审核</a></li>
					<li id="i4"><a href="keywordsList" target="inside">企业店铺名申请列表</a></li>
					<li id="i3"><a href="prepay" target="inside">店铺申请预付款</a></li>
				</ul>
			</li>
			<li class="nav-parent"><a href="javascript:;"><i class="icon icon-bar-chart-alt"></i>报表管理</a>
				<ul class="nav" id="c_3">
					<li id="i19"><a href="showReport" target="inside">报表管理</a></li>
				</ul>
			</li>
			<li class="nav-parent"><a href="javascript:;"><i class="icon icon-dollar"></i>财务管理</a>
				<ul class="nav" id="c_4">
					<li id="i6"><a href="financial" target="inside">财务转账</a></li>
				</ul>
			</li>
			<li class="nav-parent"><a href="javascript:;"><i class="icon icon-group"></i>系统用户管理</a>
				<ul class="nav" id="c_6">
					<li id="i7"><a href="rolema" target="inside">角色管理</a></li>
					<li id="i9"><a href="userma" target="inside">用户管理</a></li>
					<li id="i5"><a href="loglist" target="inside">操作日志</a></li>
				</ul>
			</li>
			<li class="nav-parent"><a href="javascript:;"><i class="icon icon-cogs"></i>系统配置设置</a>
				<ul class="nav"  id="c_5"><%--
					<li id="i11"><a href="financialType?configType=1" target="inside">财务类型</a></li>--%>
					<li id="i12"><a href="serviceType?configType=2" target="inside">店铺类型</a></li>
					<li id="i13"><a href="serviceTime?configType=3" target="inside">店铺租赁年限</a></li>
					<li id="i14"><a href="appAddress?configType=4 "target="inside">店铺URL地址</a></li>
					<li id="i15"><a href="clientType?configType=5" target="inside">企业类型</a></li>
					<li id="i16"><a href="credentialsType?configType=6" target="inside">证件类型</a></li><%--
					<li id="i17"><a href="preferentialType?configType=7" target="inside">优惠类型</a></li>--%>
					<li id="i8"><a href="roleau" target="inside">角色权限管理</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</aside>
<div class="Hui-article-box">
	<iframe src="index" frameborder="0" style="width:100%;height:100%;position:absolute;" name="inside"></iframe>
</div>
<div class="modal fade" id="saveTable">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
				<h4 class="modal-title">修改密码</h4>
			</div>
			<div class="modal-body">
				<form action="pModify" method="post"
					  id="saveForm">
					<table>
						<tr>
							<td>请输入原密码：</td><td><input type="text" id="oldpwd" name="oldpwd"></td>
						</tr>
						<tr><td></td><td><span  id="op" class="pd">您本次登录时的密码</span></td></tr>
						<tr>
							<td>请输入新密码：</td><td><input type="text" id="newpwd" name="newpwd"></td>
						</tr>
						<tr><td></td><td><span id="np" class="pd">新密码不少于6个字符</span></td></tr>
						<tr>
							<td>请确认新密码：</td><td><input type="text" id="repwd" name="repwd"></td>
						</tr>
						<tr><td></td><td><span id="rp" class="pd">新密码不少于6个字符</span></td></tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="saveBtn">保存</button>
			</div>
		</div>
	</div>
</div>
<div class="footer">
	<p>©e-boss网络公司&nbsp;版权所有</p>
</div>
</body>
</html>