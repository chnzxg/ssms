<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>
    <%@include file="../../include/general.jsp" %>
    <link rel="stylesheet" href="../css/page/tjxsp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrapValidator.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrapValidator.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap/zh_CN.js"></script>
    <script>
        function add() {
            $('#formdiv').bootstrapValidator('validate');
            if ($('#formdiv').data("bootstrapValidator").isValid()) {
                $.post({
                    url: '${pageContext.request.contextPath}/admin/updadmin.do',
                    data: $('#form').serialize(),
                    success: function (data) {
                        if (data == '1') {
                            $('#info').text('修改管理员成功');
                            setTimeout(function () {
                                location.href='${pageContext.request.contextPath}/admin/qryadmin.do?page=1&pageSize=12&purl=11';
                            }, 1000);
                        }
                        else
                            $('#info').text('修改管理员失败，请稍后重试');
                        $('#addinfo').modal('show');
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
                    aname: {
                        enabled: true,
                        message: '输入值不合法',
                        validators: {
                            stringLength: {
                                min: 1,
                                max: 10,
                                message: '长度必须在10个字符以内'
                            },
                            notEmpty: {
                                message: '名称不能为空'
                            }
                        }
                    },
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
    <div class="card2" style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
        <br>
        <div id="formdiv" style="width:100%;height:100%;">
            <form id="form" action="${pageContext.request.contextPath}/admin/updadmin.do" class="form-horizontal"
                  role="form" autocomplete="off">
                <div class="form-group">
                    <span for="aid" class="col-sm-2 control-label">id：</span>
                    <div class="col-sm-3">
                        <input readonly type="text" class="form-control" id="aid" name="aid" value="${sessionScope.admin.aid}"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <span for="aname" class="col-sm-2 control-label">姓名：</span>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="aname" name="aname" value="${sessionScope.admin.aname}"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <span for="apassword" class="col-sm-2 control-label">密码：</span>
                    <div class="col-sm-3">
                        <input type="password" class="form-control" id="apassword" name="apassword"
                               value="${sessionScope.admin.apassword}">
                    </div>
                </div>
                <div class="form-group">
                    <span for="apassword2" class="col-sm-2 control-label">重复密码：</span>
                    <div class="col-sm-3">
                        <input type="password" class="form-control" id="apassword2" name="apassword2">
                    </div>
                </div>
                <div class="form-group">
                    <span for="email" class="col-sm-2 control-label">角色：</span>
                    <div style="overflow: auto;margin-left: 15px;margin-bottom: 20px;height: 140px;width: 290px;">
                        <table>
                            <c:forEach items="${roles}" var="role" varStatus="s">
                                <c:if test="${s.index%2==0}"><tr></c:if>
                                <td><input
                                <c:forEach items="${sessionScope.admin.role}" var="arole">
                                    <c:if test="${role.rid == arole.rid}">
                                            checked="checked"
                                    </c:if>
                                </c:forEach>
                                        type="checkbox" value="${role.rid}" name="rid"></td>
                                <td>${role.rname}</td>
                                <c:if test="${s.index%2==0}"></tr></c:if>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <button type="button" class="button button-rounded button-small" data-dismiss="modal"
                        onclick="javascript:location.reload()">刷新
                </button>
                <button onclick="add()"
                        class="button button-rounded button-small button-primary button-glow">提交
                </button>
            </form>
        </div>
        <br>
    </div>
</div>

</body>
</html>