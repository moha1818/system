function checkAll(name) { 
	 var el = document.getElementsByTagName('input'); 
	 var len = el.length; 
	 for(var i=0; i<len; i++) { 
	 if((el[i].type=="checkbox") && (el[i].name==name)) { 
	 el[i].checked = true; 
	 } 
	 } 
	 } 
	 function clearAll(name) { 
	 var el = document.getElementsByTagName('input'); 
	 var len = el.length; 
	 for(var i=0; i<len; i++) { 
	 if((el[i].type=="checkbox") && (el[i].name==name)) { 
	 el[i].checked = false; 
	 } 
	 } 
	 }
	$(function(){
		$("#tijiao").click(function() {
			if (confirm("确定要保存吗？")) {
				return true;
			} else {
				return false;
			}
			});
	})