<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="../css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="../css/htmleaf-demo.css">
    <script src="../js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="../js/bubbly/bubbly-bg.js"></script>
    <script>
        $(function () {
            bubbly({
            });
        })
    </script>
    <style type="text/css">
        .login-page {
            width: 360px;
            padding: 0 0 0;
            margin: auto;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form button {
            font-family: "Microsoft YaHei", "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }

        .form button:hover, .form button:active, .form button:focus {
            background: #43A047;
        }

        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }

        .form .message a {
            color: #4CAF50;
            text-decoration: none;
        }

        .form .register-form {
            display: none;
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 300px;
            margin: 0 auto;
        }

        .container:before, .container:after {
            content: "";
            display: block;
            clear: both;
        }

        .container .info {
            margin: 50px auto;
            text-align: center;
        }

        .container .info h1 {
            margin: 0 0 15px;
            padding: 0;
            font-size: 36px;
            font-weight: 300;
            color: #1a1a1a;
        }

        .container .info span {
            color: #4d4d4d;
            font-size: 12px;
        }

        .container .info span a {
            color: #000000;
            text-decoration: none;
        }

        .container .info span .fa {
            color: #EF3B3A;
        }

        body {
            /* background: #76b852; !* fallback for old browsers *!
             background: -webkit-linear-gradient(right, #76b852, #8DC26F);
             background: -moz-linear-gradient(right, #76b852, #8DC26F);
             background: -o-linear-gradient(right, #76b852, #8DC26F);
             background: linear-gradient(to left, #76b852, #8DC26F);*/
            background: #fff url('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526458969&di=9e7507784a98d2ceaf3127d7634ee540&imgtype=jpg&er=1&src=http%3A%2F%2Fbbs.crsky.com%2F1236983883%2FMon_1401%2F25_184488_57479f9fd014fba.jpg') no-repeat left top;
            background-size: 100%;
            /*font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;*/
        }

        .shake_effect {
            -webkit-animation-name: shake;
            animation-name: shake;
            -webkit-animation-duration: 1s;
            animation-duration: 1s;
        }

        @-webkit-keyframes shake {
            from, to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%, 30%, 50%, 70%, 90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%, 40%, 60%, 80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }

        @keyframes shake {
            from, to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%, 30%, 50%, 70%, 90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%, 40%, 60%, 80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }

    </style>
</head>
<body><br><br><br><br><br><br><br><br><br>
<div class="htmleaf-container1" style="text-align: center;">
    <header class="htmleaf-header">
        <h1 style="color: white;">超市管理系统  SMS</h1>
    </header>
</div>
<div class="htmleaf-container">
    <div id="wrapper" class="login-page">
        <div id="login_form" class="form">
            <form class="login-form">
                <input type="text" placeholder="用户名" id="user_name"/>
                <input type="password" placeholder="密码" id="password"/>
                <button id="login">登　录</button>
                <i id="logininfo" style="color: dimgrey;visibility: hidden"></i>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    function check_login() {
        $('#logininfo').text('正在登陆，请稍候。。。');
        $('#logininfo').css("visibility","visible");
        var name = $("#user_name").val();
        var pass = $("#password").val();
        $.post({
            url: '${pageContext.request.contextPath}/system/login.do',
            data: {'aname': name, 'apassword': pass},
            success: function (result) {
                if (result == '1') {
                    location.href = '${pageContext.request.contextPath}/view/index.jsp';
                }
                else {
                    $('#logininfo').text('用户名或密码错误，请重试');
                    $('#logininfo').css("visibility","visible");
                    $("#login_form").removeClass('shake_effect');
                    setTimeout(function () {
                        $("#login_form").addClass('shake_effect')
                    }, 1);
                }
            }
        })

    }
    function check_register() {
        var name = $("#r_user_name").val();
        var pass = $("#r_password").val();
        var email = $("r_email").val();
        if (name != "" && pass == "" && email != "") {
            alert("注册成功！");
            $("#user_name").val("");
            $("#password").val("");
        }
        else {
            $("#login_form").removeClass('shake_effect');
            setTimeout(function () {
                $("#login_form").addClass('shake_effect')
            }, 1);
        }
    }
    $(function () {
        $("#create").click(function () {
            check_register();
            return false;
        })
        $("#login").click(function () {
            check_login();
            return false;
        })
        $('.message a').click(function () {
            $('form').animate({
                height: 'toggle',
                opacity: 'toggle'
            }, 'slow');
        });
    })
</script>

</body>
</html>