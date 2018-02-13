<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/agentmanage/1.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/agentmanage.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
<script type="text/javascript" src="jquery-ui/jquery-ui.min.js"></script>
</head>
<style type="text/css">
.ui-menu .ui-menu-item {
	float: left;
	width: 120px;
	height: 60px;
	background-color: #ddd;
	margin: 3px 5px;
}

.ui-widget-content {
	font-size: 12px;
}

#ui-id-1 {
	width: 1100px;
	height: 400px;
	border-width: 0px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#name")
				.autocomplete(
						{
							source : function(request, response) {
								var inputValue = request.term;
								$
										.ajax({
											url : 'findCusSup',
											type : 'get',
											data : 'name=' + inputValue,
											dataType : 'json',
											success : function(data) {
												$("#n a").remove();
												if (data.length == 0) {
													$("#n")
															.append(
																	"<a href=\"add_cus\">不存在该供应商，是否需要添加？</a>")
												}
												response($
														.map(
																data,
																function(item) {
																	return {
																		label : renderHTML(item),
																		key : item.id,
																		value : item.customName,
																		type : item.customTypeName
																	};
																}));
											}
										});
							},
							select : function(event, ui) {
								$("#cusName").val(ui.item.value);
								$("#cusId").val(ui.item.key);
							}
						});
		$("#name").focus(function() {
			$("#name").autocomplete("search", " ");
		});
		function renderHTML(val) {
			return '<div>客户类型：' + val.customTypeName + '<p>' + val.customName
					+ '</p>' + '</div>';
		}
		$("#key").blur(
				function() {
					var value = $(this).val();
					if ($.trim(value) == "") {
						$(this).next().html("请输入关键词").css("color", "red");
					} else {
						$.ajax({
							url : 'findkey',
							type : 'get',
							data : 'name=' + value,
							dataType : 'json',
							success : function(data) {
								if (data.msg == "success") {
									$("#key").next().html("该关键词可以提交").css(
											"color", "#00ff00");
								} else {
									$("#key").next().html("已存在该关键词").css(
											"color", "red");
								}
							}
						})
					}
				})
	});
	function count(a) {
		var time = $('#u3_input').val();
		var type = $("#u2_input").val();
		var text= $('#u3_input option:selected').text();
		if (time != 0 && type != 0) {
			var counttimevalue;//计算价格的年数
			var usetiemvalue;//使用日期的年数
			var typevalue;//服务类别
			$.ajax({
				url : 'findsys',
				type : 'get',
				data : 'systemconfig.configTypeValue=' + type+'&systemconfig.configType=2',
				dataType : 'json',
				success : function(data) {
					typevalue=data.sys.configValue;
					if(time>a){
						$.ajax({
							url : 'findsys',
							type : 'get',
							data : 'systemconfig.configTypeName=' + text+'&systemconfig.configType=7',
							dataType : 'json',
							success : function(data) {
								counttimevalue=data.sys.configValue;
								usetiemvalue=data.sys.configTypeValue;
								//给页面赋值
								var sum = typevalue * counttimevalue;
								$("#price").val(sum);
								$("#years").val(usetiemvalue);
							}
						})
					}else{
						counttimevalue=time;
						usetiemvalue=time;
						//给页面赋值
						var sum = typevalue * counttimevalue;
						$("#price").val(sum);
						$("#years").val(usetiemvalue);
					}
				}
			})
		} else {
			$("#price").val('');
		}
	}

	function compare(){
		var balance=<s:property value="balance" />;
		var money=$("#price").val();
		if(money>balance){
			alert("账户余额不足！")
			return false;
		}
	}
</script>
<body>
	<div id="n">
		<span>搜索供应商：</span><input type="text" id="name"  placeholder="输入后自动搜索"/>
	</div>
	<form id="form" method="post" action="keywords_add">
		<table class="bordered">
			<tr>
				<td>客户名称：</td>
				<td><input type="text" name="keywords.customName" id="cusName"
					style="color: red" /> <input type="hidden"
					name="keywords.customId" id="cusId"></td>
			</tr>
			<tr>
				<td>店铺名称：</td>
				<td><input type="text" id="key" name="keywords.keywords" /><span></span></td>
			</tr>
			<tr>
				<td>店铺类型：</td>
				<td><s:select name="keywords.productType" list="sys_type"
						id="u2_input" onchange="count(%{sys_years})" headerKey="0"
						headerValue="——请选择——" listKey="configTypeValue"
						listValue="configTypeName">
					</s:select></td>
			</tr>
			<tr>
				<td>店铺租赁年限：</td>
				<td><select id="u3_input"
					onchange="count(<s:property value="sys_years"/>)">
						<option value="0">——请选择——</option>
						<s:iterator begin="1" end="sys_years" status="n">
							<option value="<s:property value="#n.index+1"/>"><s:property
									value="#n.index+1" /></option>
						</s:iterator>
						<%--<s:iterator value="sys_discount" status="m">
							<option value="<s:property value="sys_years+1+#m.index"/>"><s:property
									value="configTypeName" /></option>
						</s:iterator>--%>
				</select> <input type="hidden" id="years" name="keywords.serviceYears" /></td>
			</tr>
			<tr>
				<td>价格：</td>
				<td><input type="text" id="price" name="keywords.price"
					readonly="true" style="background: #CCCCCC" /></td>
			</tr>
			<tr>
				<td><input type="submit" onclick="return compare()">
			</tr>

		</table>
	</form>
	<div style="height: 170px;"></div>
</body>
</html>
