<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/agentmanage/3.css">
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
</head>
<script type="text/javascript" src="js/laydate.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/agentmanage.js"></script>
<script src="dist/js/zui.js"></script>
<body>
<div class="container">
	<form action="add" method="post">
		<div class="row">
			<div class="col-sm-9">
				<div class="panel">
					<div class="panel-heading fz-14">基本信息</div>
					<div class="form-horizontal panel-body panel-body2 c-6">
						<div class="form-group mt-20">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>企业名称：</label>
							<div class="col-sm-4">
								<input type="text" name="customs.customName" value="<s:property value="customs.customName"/>" />
								<span class="text-danger" data-valmsg-for="userName" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group mt-20">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>企业类型：</label>
							<div class="col-sm-4">
								<s:select name="customs.customType" id="customType"
										  list="customTypes" headerKey="-1" headerValue="——请选择类型——"
										  listKey="configTypeValue" listValue="configTypeName"></s:select>
								<input type="hidden" name="customs.customTypeName"
									   id="customTypeName" value="<s:property value="customs.customTypeName"/>"  />
								<span class="text-danger" data-valmsg-for="password" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group mt-20">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>企业主页：</label>
							<div class="col-sm-4">
								<input type="text" name="customs.siteUrl" value="http://" />
								<span class="text-danger" data-valmsg-for="passwordConfirm" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group mt-20">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>状态：</label>
							<div class="col-sm-4">
								<s:select list="#{'1':'启用','0':'停用'}" name="customs.customStatus"></s:select>
								<span class="text-danger" data-valmsg-for="passwordConfirm" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="panel panel2">
							<div class="panel-heading fz-14 c-6">门户信息</div>
						</div>

						<div class="form-group mt-20">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>法人代表：</label>
							<div class="col-sm-4">
								<input type="text" name="customs.bossName" value="<s:property value="customs.bossName"/>" />
								<span class="text-danger" data-valmsg-for="enterpriseNameCN" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group mt-20">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>国家：</label>
							<div class="col-sm-4">
								<input type="text" name="customs.country" value="中国" />
								<span class="text-danger" data-valmsg-for="enterpriseNameCN" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group" id="regions">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>经营地址:</label>
							<div class="col-sm-2">
								<s:select name="customs.province" id="province"
										  list="provinces" headerKey="-1" headerValue="——请选择省——"
										  listKey="provinceId" listValue="province" />
							</div>
							<div class="col-sm-2">
								<select id="city" name="customs.city"><option
										value="-1" selected="selected">——请选择市——</option></select>
							</div>
							<div class="col-sm-4">
								<select id="area" name="customs.area"><option
										value="-1" selected="selected">——请选择区——</option></select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3">公司地址：</label>
							<div class="col-sm-4">
								<input type="text" name="customs.companyAddress" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 ">注册日期：</label>
							<div class="col-sm-4">
								<input class="laydate-icon" id="demo"
									   name="customs.regDatetime"><span><s:fielderror fieldName="customs.regDatetime"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span class="text-danger">*</span>证件类型：</label>
							<div class="col-sm-4">
								<s:select id="cardType" name="customs.cardType"
										  list="cardTypes" headerKey="-1" headerValue="——请选择类型——"
										  listKey="configTypeValue" listValue="configTypeName"></s:select> <input
									type="hidden" name="customs.cardTypeName" id="cardTypeName" <s:property value="customs.cardTypeName"/>  />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>证件号码：</label>
							<div class="col-sm-4">
								<input type="text" name="customs.cardNum" value="<s:property value="customs.cardNum"/>" />
							</div>
						</div>
						<!--Enter Your Business Information-->

						<div class="panel panel2">
							<div class="panel-heading fz-14 c-6">联系方式</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>公司传真：</label>
							<div class="col-sm-6">
								<input type="text" name="customs.companyFax" value="<s:property value="customs.companyFax"/>" />
								<span class="text-danger" data-valmsg-for="contactCN" data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label requireds"><span class="text-danger">*</span>公司电话：</label>
							<div class="col-sm-1">
								<input type="text" name="customs.companyTel" value="<s:property value="customs.companyTel"/>"  />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label"><span class="text-danger">*</span>公司邮箱：</label>
							<div class="col-sm-4">
								<input type="text" name="customs.email"/>
								<span class="text-danger" data-valmsg-for="email" data-valmsg-replace="true"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label"><span class="text-danger">*</span>备注：</label>
							<div class="col-sm-4">
								<textarea name="customs.memo" cols="50" rows="3"
										  style="resize: none;"></textarea>
								<span class="text-danger" data-valmsg-for="email" data-valmsg-replace="true"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<p>
			<a href="javascript:void(0);" style="text-decoration: none"
			   id="addline">添加一个联系人</a>
		</p>
		<table class="bordered">
			<thead id="hegin">
			<tr>
				<th>姓名</th>
				<th>电话</th>
				<th>传真</th>
				<th>邮箱</th>
				<th>职务</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
		<%--<div class="container mb-20">
			<div class="row">
				<div class="form-group mt-20 mb-20">
					<div class="col-md-offset-3 col-md-10">
						<input type="image" src="image/u59.png" /> <a
							href="pageList"><img src="image/u57.png" /></a>
					</div>
				</div>
			</div>
		</div>--%>
		<div class="last">
			<button  type="submit" class="btn btn-primary  mr-40" data-position="100px" >提交</button>
			<button type="button" class="btn btn-primary mr-40">返回</button>
		</div>
		<%--<table style="border: #CCC 1px solid; width: 1200px;">
			<tr>
				<td>企业名称：</td>
				<td><input type="text" name="customs.customName" value="<s:property value="customs.customName"/>" /><span>*<s:fielderror fieldName="customs.customName"/></span></td>
				<td>企业类型：</td>
				<td><s:select name="customs.customType" id="customType"
						list="customTypes" headerKey="-1" headerValue="——请选择类型——"
						listKey="configTypeValue" listValue="configTypeName"></s:select> <span>*<s:fielderror fieldName="customs.customType"/></span>
					<input type="hidden" name="customs.customTypeName"
					id="customTypeName" value="<s:property value="customs.customTypeName"/>"  />
					</td>
			</tr>
			<tr>
				<td>企业主页：</td>
				<td><input type="text" name="customs.siteUrl" value="http://" /></td>
				<td>状态：</td>
				<td><s:select list="#{'1':'启用','0':'停用'}" name="customs.customStatus"></s:select><span>*</span></td>
			</tr>
		</table>--%>

		<%--<p>门户信息</p>
		<table style="border: #CCC 1px solid; width: 1200px;">
			<tr>
				<td>法人代表：</td>
				<td><input type="text" name="customs.bossName" value="<s:property value="customs.bossName"/>" /><span><s:fielderror fieldName="customs.bossName"/></span></td>
				<td>注册日期</td>
				<td><input class="laydate-icon" id="demo"
					name="customs.regDatetime"><span><s:fielderror fieldName="customs.regDatetime"/></span></td>
			</tr>
			<tr>
				<td>证件类型：</td>
				<td><s:select id="cardType" name="customs.cardType"
						list="cardTypes" headerKey="-1" headerValue="——请选择类型——"
						listKey="configTypeValue" listValue="configTypeName"></s:select> <input
					type="hidden" name="customs.cardTypeName" id="cardTypeName" <s:property value="customs.cardTypeName"/>  /><span><s:fielderror fieldName="customs.cardType"/></span></td>
				<td>证件号码：</td>
				<td><input type="text" name="customs.cardNum" value="<s:property value="customs.cardNum"/>" /><span><s:fielderror fieldName="customs.cardNum"/></span></td>
			</tr>
			<tr>
				<td>国家：</td>
				<td><input type="text" name="customs.country" value="中国" /></td>
				<td>省/地区：</td>
				<td><s:select name="customs.province" id="province"
						list="provinces" headerKey="-1" headerValue="——请选择省——"
						listKey="provinceId" listValue="province" /><span><s:fielderror fieldName="customs.province"/></span></td>
			</tr>
			<tr>
				<td>公司传真：</td>
				<td><input type="text" name="customs.companyFax" value="<s:property value="customs.companyFax"/>" /><span><s:fielderror fieldName="customs.companyFax"/></span></td>
				<td>城市：</td>
				<td><select id="city" name="customs.city"><option
							value="-1" selected="selected">——请选择市——</option></select><span><s:fielderror fieldName="customs.city"/></span></td>
			</tr>
			<tr>
				<td>公司电话：</td>
				<td><input type="text" name="customs.companyTel" value="<s:property value="customs.companyTel"/>"  /><span><s:fielderror fieldName="customs.companyTel"/></span></td>
				<td>区：</td>
				<td><select id="area" name="customs.area"><option
							value="-1" selected="selected">——请选择区——</option></select><span><s:fielderror fieldName="customs.area"/></span></td>
			</tr>
			<tr>
				<td>公司地址：</td>
				<td><input type="text" name="customs.companyAddress" /></td>
				<td>公司邮箱：</td>
				<td><input type="text" name="customs.email"/></td>
			</tr>
			<tr>
				<td>备注：</td>
				<td><textarea name="customs.memo" cols="50" rows="3"
						style="resize: none;"></textarea></td>
			</tr>
		</table>--%>

	</form>
</div>
	<script type="text/javascript" src="js/laydate-2.js"></script>
</body>
</html>
