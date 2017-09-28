<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<script  src="/js/jquery.min.js"></script>
<body>
<form id="tableDate">
<table>
    <tr>
        <td><input name="id" type="text" value="1"></td>
        <td><input name="name" type="text" value="a"></td>
    </tr>
    <tr>
        <td><input name="id" type="text" value="2"></td>
        <td><input name="name" type="text" value="b"></td>
    </tr>
    <tr>
        <td><input name="id" type="text" value="3"></td>
        <td><input name="name" type="text" value="c"></td>
    </tr>
</table>
</form>
<button id="sbtn">提交</button>
<button id="sbtn1">提交</button>
<button id="sbtn2">提交</button>
<script type="text/javascript">
    /*JS数据拼接*/
    $("#sbtn").click(function(){
        var customerArray = new Array();
        customerArray.push({id: "1", name: "李四"});
        customerArray.push({id: "2", name: "张三"});
        $.ajax({
            url:'/demo/fff',
            method:'post',
            dataType:'json',
            contentType : 'application/json;charset=utf-8',//*json请求头设置
            data:JSON.stringify(customerArray),
            success:function () {
                alert("success");
            }

        })
    })
    /*$("#tableDate").serialize()*/
   $("#sbtn1").click(function(){
       $.ajax({
           url:'/demo/fffs',
           method:'post',
           data:$("#tableDate").serialize(),
           success:function () {
               alert("success");
           }

       })
   })
    /*$("#tableDate").serialize()*/
   $("#sbtn2").click(function(){
       var s=$("input[name='id']").serializeJson();
       /*var a=$("#tableDate").serialize();*/
       $.ajax({
           url:'/demo/fff',
           method:'post',
           data:s,
           dataType:'json',
           contentType : 'application/json;charset=utf-8',//*json请求头设置
           success:function () {
               alert("success");
           }

       })
   })

    $.fn.serializeJson = function(){
        var jsonData1 = {};
        var serializeArray = this.serializeArray();
        // 先转换成{"id": ["12","14"], "name": ["aaa","bbb"], "pwd":["pwd1","pwd2"]}这种形式
        $(serializeArray).each(function () {
            if (jsonData1[this.name]) {
                if ($.isArray(jsonData1[this.name])) {
                    jsonData1[this.name].push(this.value);
                } else {
                    jsonData1[this.name] = [jsonData1[this.name], this.value];
                }
            } else {
                jsonData1[this.name] = this.value;
            }
        });
        // 再转成[{"id": "12", "name": "aaa", "pwd":"pwd1"},{"id": "14", "name": "bb", "pwd":"pwd2"}]的形式
        var vCount = 0;
        // 计算json内部的数组最大长度
        for(var item in jsonData1){
            var tmp = $.isArray(jsonData1[item]) ? jsonData1[item].length : 1;
            vCount = (tmp > vCount) ? tmp : vCount;
        }

        if(vCount > 1) {
            var jsonData2 = new Array();
            for(var i = 0; i < vCount; i++){
                var jsonObj = {};
                for(var item in jsonData1) {
                    jsonObj[item] = jsonData1[item][i];
                }
                jsonData2.push(jsonObj);
            }
            return JSON.stringify(jsonData2);
        }else{
            return "[" + JSON.stringify(jsonData1) + "]";
        }
    };
</script>
</body>
</html>
