<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>财务管理</title>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link href="css/system management/financial.css" type="text/css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
<script type="text/javascript" src="jquery-ui/jquery-ui.min.js"></script>
<style type="text/css">
.ui-menu .ui-menu-item {
	float: left;
	width: 60px;
	height: 28px;
	text-align: center;
	line-height: 20px;
	background-color: #EDEDED;
	border: solid #ccc 1px;
	margin: 3px 8px;
	font-size: 14px;
}

.ui-widget-content {
	font-size: 12px;
}

#ui-id-1 {
	width: 950px;
	height: 50px;
	border-width: 0px;
}
</style>
<script type="text/javascript">
function isNum() {
	var money = $("#money").val();
	var name=$("#name").val();
	var typeName=$("#typeName").val();
	var memo=$("#memo").val();
	if (!$.isNumeric(money)) {
		$("#spanmoney").text("请输入正确格式的资金");
		return false;
	}else if(name.length==0){
		$("#spanname").text("请选择用户");
		return false;		
	}else if(typeName=="0"){
		$("#spantype").text("请选择类型");
		return false;
	}else if(memo.length==0){
		$("#spanmemo").text("请输入备注");
		return false;
	}else {
		return true;
	}
};
function ld(){
	var name = $("#typeName option:selected").text();
	$(".typeName").val(name);
}
	$(function() {
		$("#name")
				.autocomplete(
						{
							source : function(request, response) {
								var inputValue = request.term;
								$
										.ajax({
											url : 'finduser',
											type : 'get',
											data : 'name=' + inputValue,
											dataType : 'json',
											success : function(data) {
												$("#top a").remove();
												if (data.length == 0) {
													$("#top")
															.append(
																	"<a href=\"userma\">不存在该客户，是否需要添加？</a>")
												}
												response($
														.map(
																data,
																function(item) {
																	return {
																		label : renderHTML(item),
																		key : item.id,
																		value : item.userName
																	};
																}));
											}
										});
							},
							select : function(event, ui) {
								$("#id").val(ui.item.key);
							}
						});
		$("#name").focus(function() {
			$("#name").autocomplete("search", " ");
		});
		function renderHTML(val) {
			return '<div>' + val.userName + '<p>   </p>'+'</div>';
		};
		
		$("#typeName").change(function() {
			var name = $("#typeName option:selected").text();
			$(".typeName").val(name);
		});
		
	})
</script>

<s:if test="msg!=null">
	<script type="text/javascript">
		var msg = '<s:property value="msg"/>';
		alert(msg);
		if (msg == "成功") {
			location.href = financial;
		}
	</script>
</s:if>
</head>
<body onload="ld()">
	<div>
		<s:form method="post" action="/html/sub_financial">
			<div id="top">
				搜索用户： <input type="text" id="name" /> <input type="hidden" id="id"
					name="id" /><span id="spanname" class="red"></span> 输入后自动搜索
			</div>
			<div id="foot" class="">
				<table>
					<tr>
						<td>操作类型:<s:select id="typeName" name="detailType"
								list="systemconfigs" listKey="configTypeValue"
								listValue="configTypeName" headerKey="0" headerValue="—请选择—" />
							<input type="hidden" class="typeName" name="detailTypeName" />
							<span id="spantype" class="red"></span>
						</td>
					</tr>
					<tr>
						<td class="gray">操作资金：<s:textfield id="money" name="money" /><span class="red" id="spanmoney"></span><br />
							重要提示：输入的资金数，<span class="red">正数(1000)</span>为向账户增加1000元，<span
							class="red">负数(-1000)</span>为向账户减少1000元，精确到小数点2位数
						</td>
					</tr>
					<tr>
						<td>操作备注：<br /> <s:textarea cols="60" rows="10" id="memo" name="memo"></s:textarea>
						<span id="spanmemo" class="red"></span></td>
					</tr>
					<tr>
						<td><s:submit type="image"
								src="image/financial management/u5.png" onclick="return isNum()" /></td>
					</tr>
				</table>
				<div style="height: 70px"></div>
			</div>
		</s:form>
	</div>
</body>
</html>
