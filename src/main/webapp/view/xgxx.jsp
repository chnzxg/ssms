<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <link rel="stylesheet" href="../css/page/tjxsp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrapValidator.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrapValidator.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap/zh_CN.js"></script>
    <script>
        function password() {
            $('#form').bootstrapValidator('validate');
            var apassword = document.getElementById('form').apassword.value;
            if ($('#form').data("bootstrapValidator").isValid()) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/system/password.do',
                    data: $('#form').serialize(),
                    success: function (data) {
                        if (data == '1') {
                            $('#info').text('修改密码成功，请重新登录');
                            setTimeout(function () {
                                location.href='${pageContext.request.contextPath}/view/login.jsp';
                            },500);
                        }
                        else
                            $('#info').text('修改密码失败，请稍后重试');
                        $('#addinfo').modal('show')
                    }
                })
            }
        }
        $(function () {
            //表单验证
            $('#formdiv').bootstrapValidator({
                message: 'This value is not valid',
                submitButtons: 'button[type="submit"]',
                fields: {
                    apassword: {
                        enabled: true,
                        message: '输入值不合法',
                        validators: {
                            stringLength: {
                                min: 6,
                                max: 12,
                                message: '长度必须在6-12个字符之间'
                            },
                            notEmpty: {
                                message: '密码不能为空'
                            }
                        }
                    },
                    apassword2: {
                        enabled: true,
                        message: '输入值不合法',
                        validators: {
                            identical: {
                                field: 'apassword',
                                message: '两次密码不一致'
                            }
                        }
                    }
                }
            });

        })
    </script>
</head>
<body><br>
<!-- 提示窗口 -->
<div class="modal fade" id="addinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">信息</h4>
            </div>
            <div class="modal-body"><h4 id="info"></h4></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<div id="main" style="width:98%;height:100%;">
    <br>
    <div style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
        <br>
        <div id="formdiv" style="width:100%;height:100%;">
            <form id="form" action="" class="form-horizontal"
                  role="form" autocomplete="on">
                <div class="form-group">
                    <span for="ename" class="col-sm-2 control-label">姓名：</span>
                    <div class="col-sm-3">
                        <input autofocus type="text" class="form-control" id="aname" name="aname" disabled="disabled" value="${sessionScope.user.aname}"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <span for="email" class="col-sm-2 control-label">密码：</span>
                    <div class="col-sm-3">
                        <input type="password" class="form-control" id="apassword" name="apassword">
                    </div>
                </div>
                <div class="form-group">
                    <span for="email" class="col-sm-2 control-label">重复密码：</span>
                    <div class="col-sm-3">
                        <input type="password" class="form-control" id="apassword2" name="apassword2" >
                    </div>
                </div>
                <button type="button" class="button button-rounded button-small" data-dismiss="modal"
                        onclick="javascript:location.reload()">刷新
                </button>
                <button onclick="password()"
                        class="button button-rounded button-small button-primary button-glow">提交
                </button>
            </form>
        </div>
        <br>
    </div>
</div>

</body>
</html>