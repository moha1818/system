
	
  $(function(){
	  	$('#bb').click(function(){
			location.href = "getPortal";
		})
		
		$('#back').click(function(){
			location.href = "getPortal";
		})
		
		$('#save').click(function(){
			$('form').submit;
		})
	})
	
  function check(){
	 var name = $('#appUserName').val();
	 var pwd = $('#appPassword').val();
	 var a = pwd.length();
	 alert(a);
	 return false;
	 
	 /*if(name==""){
		 alert('账号不能为空');
		 return false;
	 }
	 if(pwd==""){
		 alert('密码不能为空');
		 return false;
		 
	 }else if(pwd.length()<6){
		 
		 alert('密码长度不小于6位');
		 return false;
	 }*/
  }