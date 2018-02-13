// JavaScript Document
function confir(a, id) {
	var text = $.trim($(a).text());
	var val;
	if (text == '停用') {
		val = '启用'
	} else {
		val = '停用'
	}
	var username = $(a).parents("tr").find("td").eq(2).text();

	if (confirm('你是否要' + text + '【' + username + '】这个客户吗？')) {
		$.ajax({
			type : "get",
			url : "open",
			data : "status=" + text + "&id=" + id,
			dataType : "json",
			success : function(data) {
				if (data.msg == "SUCCESS") {
					if (text == '停用') {
						$(a).text(val).attr("class","btn btn-sm btn-success");
						$(a).parent().prev().children().text(text).attr("class","label label-badge label-warning");
					} else {
						$(a).text(val).attr("class","btn btn-sm btn-danger");
						$(a).parent().prev().children().text(text).attr("class","label label-badge label-success");
					}
				} else {
					alert(text + "失败");
				}
			}
		})
	} else {
		return false;
	}

}
// 删除联系人行
function del(a) {
	$(a).parent().parent().remove();
}
// 删除数据库联系人
function del_data(a, id) {
	var con = confirm("是否删除该条联系人？");
	if (con) {
		$.ajax({
			type : "get",
			url : "delcontact",
			data : "id=" + id,
			dataType : "json",
			success : function(data) {
				if (data.msg == "SUCCESS") {
					$(a).parent().parent().remove();
				} else {
					alert("删除失败");
				}
			}
		})
	}
}

$(function() {
	// 跳转至添加用户页面
	$("#add").click(function() {
		location.href = "add_cus";
	})
	// 添加联系人
	$("#addline")
			.click(
					function() {
						var lens = $(".bordered tbody").children("tr").length;

						var line = "<tr> <td><input type=\"text\" name=\"contacts["
								+ lens
								+ "].contactName\" class=\"contactName\" /></td> "
								+ " <td><input type=\"text\" name=\"contacts["
								+ lens
								+ "].contactTel\" class=\"contactTel\" /></td> <td><input type=\"text\" name=\"contacts["
								+ lens
								+ "].contactFax\" /></td>"
								+ " <td><input type=\"text\" name=\"contacts["
								+ lens
								+ "].contactEmail\" class=\"contactTel\" /></td>"
								+ " <td><input type=\"text\" name=\"contacts["
								+ lens
								+ "].contactRole\" class=\"contactRole\" /></td>"
								+ " <td><a href=\"javascript:void(0);\" onclick=\"del(this)\" style=\"text-decoration:none\" >删除</a></td></tr>";
						$(".bordered tbody").append(line);
					});

	// 市区联动
	$("#province").change(function() {
		empty('area', '区');
		var provinceId = $(this).val();
		if (provinceId == -1) {
			empty('city', '市');
			return;
		}
		$.ajax({
			type : "get",
			url : "city",
			data : "provinceId=" + provinceId,
			dataType : 'json',
			success : function(data) {
				addcityList(data);
			}
		})

	});
	$("#city").change(function() {
		var cityId = $(this).val();
		if (cityId == -1) {
			empty('area', '区');
			return;
		}
		$.ajax({
			type : 'get',
			url : 'area',
			data : "cityID=" + cityId,
			dataType : 'json',
			success : function(data) {
				addareaList(data);
			}
		})
	});
	// hidden customTypeName
	$("#customType").change(function() {
		var tex = $(this).find("option:selected").text();
		$(this).parent().find("input").attr('value', tex);
	})
	// hidden cardTypeName
	$("#cardType").change(function() {
		var tex = $(this).find("option:selected").text();
		$(this).parent().find("input").attr('value', tex);
	})
	
})
// city list
function addcityList(str) {
	empty('city', '市');
	for (i = 0; i < str.length; i++) {
		$("#city").append(
				"<option value='" + str[i].cityID + "'>" + str[i].city
						+ "</option>")
	}

}
// area list
function addareaList(str) {
	empty('area', '区');
	for (i = 0; i < str.length; i++) {
		$("#area").append(
				"<option value='" + str[i].areaID + "'>" + str[i].area
						+ "</option>")
	}

}
// 选择框初始化
function empty(str, cnstr) {
	$("#" + str + "").empty();
	$("#" + str + "").append(
			"<option value='-1' selected='selected'>——请选择" + cnstr
					+ "——</option></select>");
}
