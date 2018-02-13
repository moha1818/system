$(function(){
		$(".add").click(function(){
			
			$(".adduser").css('display','block');
		});	
		$(".cancel1").click(function(){
			$(".adduser").css('display','none');
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
		
		$("#tijiao1").click(function(){
			if($("#roleName1").val()==""){
				alert("角色名称为空，添加失败");				
			}
		});
		$("#tijiao2").click(function(){
			if($("#roleName2").val()==""){
				alert("角色名称为空，添加失败");				
			}
		});
		$("#roleName1").blur(function(){
			if($("#roleName1").val()==""){
				$("#tishi1").next().html("请输入角色名称");
			}else{
				$("#tishi1").next().html("");
			}
		})
		$("#roleName2").blur(function(){
			if($("#roleName2").val()==""){
				$("#tishi2").next().html("请输入角色名称");
			}else{
				$("#tishi2").next().html("");
			}
		})
	});
function aa(dom){
	
	$.ajax({
		url:'selectRole',
		type:'get',
		data:'id='+dom,
		dataType:'json',
		success:function(data){
				$(".modify").css('display','block');
				$("#roleName2").val(data.role.roleName);
				$("#action").attr("action","modifyRole?id="+dom+"");
			}
	
		})
}
function tijiao1(){
		
		if($("#roleName1").val()==""){
			return false;
		}
		}
function tijiao2(){
		if($("#roleName2").val()==""){
			return false;
		}
		
		}