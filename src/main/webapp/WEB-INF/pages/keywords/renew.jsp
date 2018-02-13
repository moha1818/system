<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/agentmanage.js"></script>
	<script src="dist/js/zui.js"></script>
	<link type="text/css" rel="stylesheet" href="dist/css/zui.css" />
<link rel="stylesheet" type="text/css" href="css/agentmanage/4.css">
<script type="text/javascript">
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
					$("#countPrice").val(sum);
					$("#years").val(usetiemvalue);
				}
			}
		})
	} else {
		$("#price").val('');
	}
}

function compare(){
	var balance=<s:property value="money" />;
	var money=$("#price").val();
	if(money>balance){
		alert("账户余额不足！")
		return false;
	}else if(money==""){
		alert("请选择服务类型和年限")
		return false;
	}
}
$(function(){
	$('#sub').click(function(){
		alert('恭喜您，续费成功！');
		var href = window.parent.location;
		window.parent.location.href = href;
	})
})


</script>
</head>
<body>
<div id="head">
<%--<span>为<s:property value="key.keywords"/>续费，<span style="color:red" >【当前账户余额：￥<s:number name="money"/>】</span>--%>
</div>
<form id="form" action="renew" method="get">
<table class="bordered">
    <tr>
        <td>客户名称：</td>        
        <td><input name="keywordName" readonly="true" type="text" value="<s:property value="key.customName"/>"/></td>
    </tr>
    <tr>
		<td>店铺名称：</td>
        <td><input readonly="true" type="text" value="<s:property value="key.keywords"/>"/><input name="kid" type="hidden" value="<s:property value="key.id"/>"></td>
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
		<td>企业租赁年限：</td>
		<td><select id="u3_input"
			onchange="count(<s:property value="sys_years"/>)">
			<option value="0">——请选择——</option>
				<s:iterator begin="1" end="sys_years" status="n">
					<option value="<s:property value="#n.index+1"/>"><s:property
						value="#n.index+1" /></option>
				</s:iterator>
			</select> <input type="hidden" id="years" name="years" />
		</td>
	</tr> 
    <tr>
		<td>价格：</td>        
        <td><input type="text"  value="" id="price" readonly="true" style="background:#CCCCCC;color:black"  disabled="disabled"/></td>
        <input type="hidden" id="countPrice" name="price" />
    </tr>
    <tr>
    	<td><%--<input onclick="return compare()" type="image" id="sub" src="image/u22.png"/>--%>
			<input type="submit" id="sub" onclick="return compare()" value="提交" class="btn btn-primary btn-mini">
		</td>
    </tr>
             
</table>
</form> 
</body>
</html>