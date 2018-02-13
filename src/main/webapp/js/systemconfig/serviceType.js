function isNum() {
	var configTypeName = $("#configTypeName").val();
	var configValue = $("#configValue").val();
	var isStart = $("#isStart").val();
	if (configTypeName.length > 20) {
		$("#spanconfigTypeName").text("名称过长");
		return false;
	} else if (configTypeName.length == 0) {
		$("#spanconfigTypeName").text("请输入名称");
		return false;
	} else if (configValue.length > 20) {
		$("#spanconfigValue").text("类型数值过长");
		return false;
	} else if (configValue.length == 0) {
		$("#spanconfigValue").text("请输入数值");
		return false;
	} else if (isStart == "-1") {
		$("#spanisStart").text("请选择是否启用");
		return false;
	} else {
		return true;
	}
};
function isNum1() {
	var configTypeName = $("#configTypeName1").val();
	var configValue = $("#configValue1").val();
	var isStart = $("#isStart1").val();
	if (configTypeName.length > 20) {
		$("#spanconfigTypeName1").text("名称过长");
		return false;
	} else if (configTypeName.length == 0) {
		$("#spanconfigTypeName1").text("请输入名称");
		return false;
	} else if (configValue.length > 20) {
		$("#spanconfigValue1").text("类型数值过长");
		return false;
	} else if (configValue.length == 0) {
		$("#spanconfigValue1").text("请输入数字");
		return false;
	} else if (isStart == "-1") {
		$("#spanisStart1").text("请选择是否启用");
		return false;
	} else {
		return true;
	}
};
function some(a) {
	var val = $(a).parent().parent().next().val();
	$.ajax({
		url : 'showSystemConfig',
		type : 'get',
		data : 'id=' + val,
		dataType : 'json',
		success : function(data) {
			$(".modify").css('display', 'block');
			$("#action").attr(
					"action",
					"updateSystemconfig?id=" + data.id + "&configType="
							+ data.configType + "&configTypeValue="
							+ data.configTypeValue + "");
		}
	})
}