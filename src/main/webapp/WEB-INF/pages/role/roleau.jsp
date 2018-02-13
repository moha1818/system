<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色权限分配</title>
  <link href="css/system management/roleau.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$(".role").click(function(){
  			$(this).parent().addClass("click");
  			$(this).parent().siblings().removeClass("click");
  		})
  	})
  </script>
 </head>
 <body>
  <div  class="">
	<div  class="left">
		<ul>
			<s:iterator value="rolemalist" var="list">
			<li  ><a class="role" href="featurelist?roleid=<s:property value="#list.id"/>" target="iframe_a" >+<s:property value="#list.roleName"/></a></li>
			</s:iterator>
		</ul>
	</div>
	<div  class="right">
		<iframe src="" id="iframepage" name="iframe_a" height="98%" width="98%"
		   frameborder="0"></iframe>
	</div>
  </div>
 </body>
</html>