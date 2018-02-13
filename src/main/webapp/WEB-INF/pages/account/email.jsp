<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta name="description" content=""/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
</head>
<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="js/bootstrap/css/font-awesome.css"/>
<link rel="stylesheet" href="static/ace/css/ace.css">
<link rel="stylesheet" href="static/ace/css/ace-fonts.css">
<link rel="stylesheet" href="static/crm.css"/>
<style>
    body{
        background-color:inherit;
    }
</style>
<body class="no-skin">
<form id="emailForm" action="" method="post">
    <input type="hidden" name="eidGroup" value="${param.ids }"/>
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="form-group">
                <label class="col-sm-2 control-label">发送到：</label>

                <div class="col-sm-10">
                    <input type="text" class="form-control" name="targetEmail"
                           readonly="readonly" value="${param.emails }">
                </div>
            </div>
            </br>
            <div class="form-group">
                <label class="col-sm-2 control-label">主题：</label>

                <div class="col-sm-10">
                    <input type="text" class="form-control" id="subject"
                           name="subject" value="">
                </div>
            </div>
            <h4 class="header green clearfix">
					<span class="block pull-right"> <small class="grey middle">Choose
							style: &nbsp;</small> <span class="btn-toolbar inline middle no-margin">
							<span data-toggle="buttons" class="btn-group no-margin"> <label
                                    class="btn btn-sm btn-yellow"> 1 <input type="radio"
                                                                            value="1"/>
							</label> <label class="btn btn-sm btn-yellow "> 2 <input
                                    type="radio" value="2"/>
							</label> <label class="btn btn-sm btn-yellow active"> 3 <input
                                    type="radio" value="3"/>
							</label> <label class="btn btn-sm btn-yellow "> 4 <input
                                    type="radio" value="4"/>
							</label>
						</span>
					</span>
					</span>
            </h4>

            <div class="wysiwyg-editor" id="editor1"></div>
            <input type="hidden" id="contentPutHere" name="content" value="">

            <div class="hr hr-double dotted"></div>

            <div class="row"></div>
        </div>
    </div>
</form>

<!-- 提交 -->
<div>
    <a id="sendEmaila" onclick="commit()" class="btn btn-sm btn-primary"
       data-toggle="tooltip" data-placement="top" title="发送邮件"><i
            class="fa fa-reply"></i> 发送</a>

    <button class="btn btn-danger btn-sm outEmail" data-dismiss="modal" title="退出">放弃</button>
</div>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    $(function(){
        $(".outEmail").click(function () {
            location.href="pageList";
        })
    })
    //发送验证
    function commit() {

        //定义两个标记变量
        var success = 1;
        var fail = 0;

        var sHTML = $('#editor1').html(); //取到编辑器里面的内容
        var subject = $("#subject").val();
        //alert(subject)
        if (subject == "") {
            alert("请填写主题!");
            return;
        }
        //alert(sHTML)
        if (sHTML.trim() == "") {
           alert("请填写邮件内容!");
            return;
        }
        $("#sendEmaila").html("<i class=\"fa fa-reply\"></i>发送中").attr("disabled","disabled");
        $("#contentPutHere").val(sHTML);

        $.post("sendEmail", $("#emailForm").serialize(),
                function (data) {
                    if (data.msg == 1) {
                        alert("发送成功！")
                        location.href="pageList";
                    }else{
                        alert("发送失败！");
                        location.href="pageList";
                    }
                });

    }

    jQuery(function ($) {

        function showErrorAlert(reason, detail) {
            var msg = '';
            if (reason === 'unsupported-file-type') {
                msg = "Unsupported format " + detail;
            } else {
                //console.log("error uploading file", reason, detail);
            }
            $(
                    '<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
                    + '<strong>File upload error</strong> '
                    + msg
                    + ' </div>').prependTo('#alerts');
        }

        //$('#editor1').ace_wysiwyg();//this will create the default editor will all buttons

        //but we want to change a few buttons colors for the third style
        $('#editor1').ace_wysiwyg({
            toolbar: ['font', null, 'fontSize', null, {
                name: 'bold',
                className: 'btn-info'
            }, {
                name: 'italic',
                className: 'btn-info'
            }, {
                name: 'strikethrough',
                className: 'btn-info'
            }, {
                name: 'underline',
                className: 'btn-info'
            }, null, {
                name: 'insertunorderedlist',
                className: 'btn-success'
            }, {
                name: 'insertorderedlist',
                className: 'btn-success'
            }, {
                name: 'outdent',
                className: 'btn-purple'
            }, {
                name: 'indent',
                className: 'btn-purple'
            }, null, {
                name: 'justifyleft',
                className: 'btn-primary'
            }, {
                name: 'justifycenter',
                className: 'btn-primary'
            }, {
                name: 'justifyright',
                className: 'btn-primary'
            }, {
                name: 'justifyfull',
                className: 'btn-inverse'
            }, null, {
                name: 'createLink',
                className: 'btn-pink'
            }, {
                name: 'unlink',
                className: 'btn-pink'
            }, null, {
                name: 'insertImage',
                className: 'btn-success'
            }, null, 'foreColor', null, {
                name: 'undo',
                className: 'btn-grey'
            }, {
                name: 'redo',
                className: 'btn-grey'
            }],
            'wysiwyg': {
                fileUploadError: showErrorAlert
            }
        }).prev().addClass('wysiwyg-style2');


        $('#editor2').css({
            'height': '900px'
        }).ace_wysiwyg(
                {
                    toolbar_place: function (toolbar) {
                        return $(this).closest('.widget-box').find(
                                '.widget-header').prepend(toolbar).find(
                                '.wysiwyg-toolbar').addClass('inline');
                    },
                    toolbar: ['bold', {
                        name: 'italic',
                        title: 'Change Title!',
                        icon: 'ace-icon fa fa-leaf'
                    }, 'strikethrough', null, 'insertunorderedlist',
                        'insertorderedlist', null, 'justifyleft',
                        'justifycenter', 'justifyright'],
                    speech_button: false
                });

        $('[data-toggle="buttons"] .btn').on(
                'click',
                function (e) {
                    var target = $(this).find('input[type=radio]');
                    var which = parseInt(target.val());
                    var toolbar = $('#editor1').prev().get(0);
                    if (which >= 1 && which <= 4) {
                        toolbar.className = toolbar.className.replace(
                                /wysiwyg\-style(1|2)/g, '');
                        if (which == 1)
                            $(toolbar).addClass('wysiwyg-style1');
                        else if (which == 2)
                            $(toolbar).addClass('wysiwyg-style2');
                        if (which == 4) {
                            $(toolbar).find('.btn-group > .btn').addClass(
                                    'btn-white btn-round');
                        } else
                            $(toolbar).find('.btn-group > .btn-white')
                                    .removeClass('btn-white btn-round');
                    }
                });

        if (typeof jQuery.ui !== 'undefined' && ace.vars['webkit']) {

            var lastResizableImg = null;

            function destroyResizable() {
                if (lastResizableImg == null)
                    return;
                lastResizableImg.resizable("destroy");
                lastResizableImg.removeData('resizable');
                lastResizableImg = null;
            }

            var enableImageResize = function () {
                $('.wysiwyg-editor')
                        .on(
                                'mousedown',
                                function (e) {
                                    var target = $(e.target);
                                    if (e.target instanceof HTMLImageElement) {
                                        if (!target.data('resizable')) {
                                            target.resizable({
                                                aspectRatio: e.target.width / e.target.height,
                                            });
                                            target.data('resizable', true);

                                            if (lastResizableImg != null) {
                                                //disable previous resizable image
                                                lastResizableImg
                                                        .resizable("destroy");
                                                lastResizableImg
                                                        .removeData('resizable');
                                            }
                                            lastResizableImg = target;
                                        }
                                    }
                                }).on(
                        'click',
                        function (e) {
                            if (lastResizableImg != null
                                    && !(e.target instanceof HTMLImageElement)) {
                                destroyResizable();
                            }
                        }).on('keydown', function () {
                    destroyResizable();
                });
            }

            enableImageResize();
        }

    });
</script>
</body>
</html>