$(function(){
	$(".userName").blur(function(){
		if($(this).val()==""){
			$(this).next().html("请输入用户名称");
		}else{
			$(this).next().html("");
		}
	})
	$(".userCode").blur(function(){
		if($(this).val()==""){
			$(this).next().html("请输入用户账户");
		}else{
			$(this).next().html("");
		}
	})
	$(".middle1").click(function(){
		
		$(".adduser").css('display','block');
	});	
	$(".cancel1").click(function(){
		$(".adduser").css('display','none');
	});
	$(".pay1").click(function(){	
		$(".payment").css('display','block');
	});	
	
	$(".cancel2").click(function(){
		$(".modify").css('display','none');
	});

	$(".delete").click(function() {
	if (confirm("确定要删除吗？")) {
		alert("删除成功");
	} else {
		return false;
	}
	});
	
	$(".pre").click(function(){
		var id = $(this).parent().parent().next(':input').val();
		$.XYTipsWindow({
			___title:"预付款",
			___content:"iframe:prepay?id="+id,
			___width:"2400px;",
			___height:"500px;",
			___drag:"___boxTitle"

		});
	});
	$(".log").click(function(){
		var id = $(this).parent().parent().next(':input').val();
		$.XYTipsWindow({
			___title:"LOG日志",
			___content:"iframe:loglist?id="+id,
			___width:"1200px;",
			___height:"500px;",
			___drag:"___boxTitle"

		});
	});
	
})
function some(a){
		  
		  var val = $(a).parent().parent().next().val();
			$.ajax({
				url:'selectUser',
				type:'get',
				data:'id='+val,
				dataType:'json',
				success:function(data){
						
						$(".modify").css('display','block');
						$("#mouserCode").val(data.user.userCode);
						$("#mouserName").val(data.user.userName);
						$("#moPassword").val(data.user.userPassword);
						$("#moroleid").val(data.user.roleId);
						$("#moisStart").val(data.user.isStart);
						$("#action").attr("action","updateUser?id="+data.user.id+"");
					}
			
				})
			}
	  function iFrameHeight() {
			var ifm = document.getElementById("iframepage");
			var subWeb = document.frames ? document.frames["iframepage"].document
					: ifm.contentDocument;
			if (ifm != null && subWeb != null) {
				ifm.height = subWeb.body.scrollHeight;
				ifm.width = subWeb.body.scrollWidth;
			}
		}
function tijiao1(){
			
			if($("#userCode1").val()==""||$("#userName1").val()==""||$("#userPassword1").val()==""||$("#roleid1").val()==""){
				alert("添加失败,请将信息输入完整");
				return false;
			}
			}
function tijiao2(){
			if($("#mouserCode").val()==""||$("#mouserName").val()==""||$("#moPassword").val()==""||$("#moroleid").val()==""){
				alert("修改失败,请将信息输入完整");
				return false;
			}
			
			}	