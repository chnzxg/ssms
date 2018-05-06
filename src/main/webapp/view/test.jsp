<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/5
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../include/general.jsp" %>
    <link rel="stylesheet" href="../css/page/tjxsp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrapValidator.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrapValidator.js"></script>
    <script>
        $(function () {
            $('#formdiv').bootstrapValidator({
                message: 'This value is not valid',
                live: 'enabled',
                submitButtons: 'button[type="submit"]',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    //多个重复
                    username: {
                        //隐藏或显示 该字段的验证
                        enabled: true,
                        //错误提示信息
                        message: 'This value is not valid',
                        // 定义每个验证规则
                        validators: {
                            stringLength: {//检测长度
                                min: 6,
                                max: 30,
                                message: '长度必须在6-30之间'
                            }
                        }
                    }
                }
            });
        });
    </script>
</head>
<body>
<form id="formdiv">
    <div class="form-group">
        <label>Username</label>
        <input type="text" class="form-control" name="username"/>
    </div>
    <div class="form-group">
        <label>Email address</label>
        <input type="text" class="form-control" name="email"/>
    </div>
    <div class="form-group">
        <button type="submit" name="submit" class="btn btn-primary">Submit</button>
    </div>
</form>
</body>
</html>
