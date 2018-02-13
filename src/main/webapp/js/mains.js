

//退出时提示
$(function(){
	$('#out').click(function(){
		
		if (confirm("你确定要退出吗？请确认")) {
			return true;
		} else {
			return false;
		}
	})
})

//密码修改表单验证
$(function(){
	var ok1=false;
    var ok2=false;
    var ok3=false;
    
 $('#oldpwd').blur(function(){
	
	if($(this).val().length==0){
		$('#op').html('原密码不能为空').addClass('pwdmsg');
	}else{
		$('#op').removeClass('pwdmsg');
		ok1 = true;
	}
 	}).click(function(){
 		$('#op').removeClass('pwdmsg').html('您本次登录时的密码');
 	})
 $('#newpwd').blur(function(){

		if($(this).val().length==0){
			$('#np').html('新密码不能为空').addClass('pwdmsg');
		} else if($(this).val().length<6){
			$('#np').html('密码长度必须大于6位').addClass('pwdmsg');
		} else{
			$('#np').removeClass('pwdmsg');
			ok2 = true;
		}
 	}).click(function(){
		$('#np').removeClass('pwdmsg').html('新密码不少于6个字符');
		
	})
 $('#repwd').blur(function(){
	 
	if($(this).val()!=$('#newpwd').val()){
		$('#rp').html('两次输入密码不一致，请重新输入').addClass('pwdmsg');
	}else{
		$('#rp').removeClass('pwdmsg');
		ok3 = true;
		}
 	}).click(function(){
 		$('#rp').removeClass('pwdmsg').html('再次填写新密码');
 	})

 $('#saveBtn').click(function(){
     if(!(ok1 && ok2 && ok3)){
    	 return false;
     }else{
     	$("#saveForm").submit();
	 }
 });
 	
})

//导航
$(function(){
	$('#p_1').click(function(){
		$('#n1').html('代理商管理');
		$('#n2').html('&#92;&nbsp;当前账户信息');
		$('#n3').html('');
	})
	$('#p_2').click(function(){
		$('#n1').html('门户管理');
		$('#n2').html('&#92;&nbsp;门户管理');
		$('#n3').html('');
	})
	$('#p_3').click(function(){
		$('#n1').html('报表管理');
		$('#n2').html('&#92;&nbsp;报表管理');
		$('#n3').html('');
	})
	$('#p_4').click(function(){
		$('#n1').html('系统管理');
		$('#n2').html('&#92;&nbsp;财务管理');
		$('#n3').html('');
	})
	$('#p_5').click(function(){
		$('#n1').html('系统配置管理');
		$('#n2').html('&#92;&nbsp;财务类型');
		$('#n3').html('');
	})
	$('#i1').click(function(){
		$('#n2').html('&#92;&nbsp;关键词申请');
		$('#n3').html('');
	})
	$('#i2').click(function(){
		$('#n2').html('&#92;&nbsp;代理商客户管理');
		$('#n3').html('');
	})
	$('#i3').click(function(){
		$('#n2').html('&#92;&nbsp;代理商预付款');
		$('#n3').html('');
	})
	$('#i4').click(function(){
		$('#n2').html('&#92;&nbsp;关键词申请管理');
		$('#n3').html('');
	})
	$('#i5').click(function(){
		$('#n2').html('&#92;&nbsp;操作日志');
		$('#n3').html('');
	})
	$('#i6').click(function(){
		$('#n2').html('&#92;&nbsp;财务管理');
		$('#n3').html('');
	})
	$('#i7').click(function(){
		$('#n2').html('&#92;&nbsp;角色管理');
		$('#n3').html('');
	})
	$('#i8').click(function(){
		$('#n2').html('&#92;&nbsp;角色权限管理');
		$('#n3').html('');
	})
	$('#i9').click(function(){
		$('#n2').html('&#92;&nbsp;用户管理');
		$('#n3').html('');
	})
	$('#i10').click(function(){
		$('#n2').html('&#92;&nbsp;关键词审核');
		$('#n3').html('');
	})
	$('#i11').click(function(){
		$('#n2').html('&#92;&nbsp;财务类型');
		$('#n3').html('');
	})
	$('#i12').click(function(){
		$('#n2').html('&#92;&nbsp;服务类型');
		$('#n3').html('');
	})
	$('#i13').click(function(){
		$('#n2').html('&#92;&nbsp;服务年限');
		$('#n3').html('');
	})
	$('#i14').click(function(){
		$('#n2').html('&#92;&nbsp;app地址');
		$('#n3').html('');
	})
	$('#i15').click(function(){
		$('#n2').html('&#92;&nbsp;客户类型');
		$('#n3').html('');
	})
	$('#i16').click(function(){
		$('#n2').html('&#92;&nbsp;证件类型');
		$('#n3').html('');
	})
	$('#i17').click(function(){
		$('#n2').html('&#92;&nbsp;优惠类型');
		$('#n3').html('');
	})
	$('#i18').click(function(){
		$('#n3').html('');
	})
	$('#i19').click(function(){
		$('#n3').html('');
	})
})
//下拉框
$(document).ready(function(){
    $(".Hui-userbar").mouseover(function(){
        var hover=$(".dropDown_hover");
        hover.addClass("hover");
        hover.addClass("open");
    })
    $(".Hui-userbar").mouseout(function(){
        var hover=$(".dropDown_hover");
        hover.removeClass("hover");
        hover.removeClass("open");
    })
})


