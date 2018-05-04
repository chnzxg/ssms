<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/4
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户登录</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
    <script>
        function login() {
            var username = $('#username').val();
            var password = $('#password').val();
            $.post({
                url: '${pageContext.request.contextPath}/system/login.do',
                data: {'aname': username, 'apassword': password},
                success: function (result) {
                    if (result == '1')
                        location.href = '${pageContext.request.contextPath}/view/index.jsp';
                    else
                        alert('用户名或密码错误！');
                }
            })
        }
    </script>
</head>
<body>
    <input type="text" name="username" id="username"><br>
    <input type="password" name="username" id="password"><br>
    <button onclick="login()">登录</button>
</body>
</html>
