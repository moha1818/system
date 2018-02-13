<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/System configuration management/serviceTime.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
var id='<s:property value="id"/>';
var configValue='<s:property value="configValue"/>';
var isStart='<s:property value="isStart"/>';
var configType='<s:property value="configType"/>';
var configTypeName='<s:property value="configTypeName"/>';
var configTypeValue='<s:property value="configTypeValue"/>';
$(document).ready(function(){ 
		document.getElementById( 'id' ).value =id;
		document.getElementById( 'configValue' ).value =configValue;
		document.getElementById( 'isStart' ).value =isStart;
		document.getElementById( 'configType' ).value =configType;
		document.getElementById( 'configTypeName' ).value =configTypeName;
		document.getElementById( 'configTypeValue' ).value =configTypeValue	;
	}) 
	var msg = "<s:property value='msg' />"
	if (msg!=null&&msg!="") {
		alert(msg);	
	}
	function isNum() {
		var configTypeName = $("#configTypeName").val();
		var configValue=$("#configValue").val();
	
		if (configTypeName.length>20) {
			$("#spanconfigTypeName").text("名称过长");
			return false;
		}else if(configTypeName.length==0){
			$("#spanconfigTypeName").text("请输入名称");
			return false;
			
		}else if(configValue.length>20){
			$("#spanconfigValue").text("类型数值过长");
			return false;
			
		}
		else if(configValue.length==0){
			$("#spanconfigValue").text("请输入名称");
			return false;
			
		}
		else if(configValue.length==0){
			$("#spanconfigValue").text("请输入名称");
			return false;
			
		}
		else {
			return true;
		}
	};
</script>

</head>
<body>
	<div id="top"></div>
	<div id="div_fuwu">
	<form action="updateSystemconfig" style="border: 1px solid #C4C4C4"
			method="post">
			<s:hidden id="id" value='' name="id" />
			<s:hidden id="configTypeValue" value='' name="configTypeValue" />
			<s:hidden id="isStart" value='' name="isStart" />
			<s:hidden id="configType" value='' name="configType" />
			<p align="center">店铺基URL管理-填写店铺的URL基地址</p>
			<hr color="#C4C4C4" width="800px;" size="1px" />
			<p align="center">
				配置名称：
				<s:textfield name="configTypeName" value="" id="configTypeName" />
			</p>
			<p align="center">
				配置数值：
				<s:textfield name="configValue" value="" id="configValue"  onclick="return isNum()"  />
			</p>
			<p align="center">
				<s:submit type="image" src="image/u7.png" />
			</p>
		</form>
	</div>
	


</body>
</html>