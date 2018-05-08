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
        function add() {
            $('#formdiv').bootstrapValidator('validate');
            if ($('#formdiv').data("bootstrapValidator").isValid()) {
                $.post({
                    url: '${pageContext.request.contextPath}/role/addrole.do',
                    data: $('#form').serialize(),
                    success: function (data) {
                        if (data == '1') {
                            $('#info').text('添加角色成功');
                            setTimeout(function () {
                                location.reload();
                            },1000);
                        }
                        else
                            $('#info').text('添加角色失败，请稍后重试');
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
                    rname: {
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
            <form id="form" class="form-horizontal"
                  role="form" autocomplete="off">
                <div class="form-group">
                    <span for="ename" class="col-sm-2 control-label">名称：</span>
                    <div class="col-sm-3">
                        <input autofocus type="text" class="form-control" id="rname" name="rname"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <span for="email" class="col-sm-2 control-label">角色：</span>
                    <div style="overflow: auto;margin-left: 15px;margin-bottom: 20px;height: 140px;width: 290px;">
                        <table>
                            <c:forEach items="${powers}" var="power" varStatus="s">
                                <c:if test="${s.index%2==0}"><tr></c:if>
                                <td><input type="checkbox" value="${power.pid}" name="pid"></td>
                                <td>${power.pname}</td>
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