<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>
    <title>Xenon - Dashboard</title>
    <%@include file="../include/general.jsp" %>
    <link rel="stylesheet" href="../assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="../assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
    <link rel="stylesheet" href="../assets/css/xenon-core.css">
    <link rel="stylesheet" href="../assets/css/xenon-forms.css">
    <link rel="stylesheet" href="../assets/css/xenon-components.css">
    <%--<link rel="stylesheet" href="../assets/css/xenon-skins.css">--%>
    <link rel="stylesheet" href="../assets/css/custom.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/general.css">
    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <script>

        //主页面跳转
        function jumpTo(url) {
            $("#main-iframe").attr("src", url);
        }
        function tohome() {
            location.href = '${pageContext.request.contextPath}/view/welcome.jsp';
        }
        function ihome(){
            window.parent.location.href='${pageContext.request.contextPath}/view/welcome.jsp';
        }
        function irefresh() {
            document.getElementById('main-iframe').contentWindow.location.reload(true);
        }
        function ilogout() {
            location.href = '${pageContext.request.contextPath}/system/logout.do';
        }
    </script>
    <style type="text/css">
        #result {
            width: 15%;
            height: 100%;
            font-size: 15px;
            margin: 0px auto;
            color: white;
            float: left;
        }
    </style>
</head>
<body class="page-body" style="height: 99%;" onload="showTime()">
<div class="settings-pane">
    <a href="#" data-toggle="settings-pane" data-animate="true">
        &times;
    </a>
    <div class="settings-pane-inner">
        <div class="row">
            <div class="col-md-4">
                <div class="user-info">
                    <div class="user-image">
                        <a href="extra-profile.html">
                            <img src="../assets/images/user-2.png" class="img-responsive img-circle"/>
                        </a>
                    </div>
                    <div class="user-details">
                        <h3>
                            <a href="extra-profile.html">John Smith</a>
                            <!-- Available statuses: is-online, is-idle, is-busy and is-offline -->
                            <span class="user-status is-online"></span>
                        </h3>
                        <p class="user-title">Web Developer</p>
                        <div class="user-links">
                            <a href="extra-profile.html" class="btn btn-primary">Edit Profile</a>
                            <a href="extra-profile.html" class="btn btn-success">Upgrade</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8 link-blocks-env">
                <div class="links-block left-sep">
                    <h4>
                        <span>Notifications</span>
                    </h4>

                    <ul class="list-unstyled">
                        <li>
                            <input type="checkbox" class="cbr cbr-primary" checked="checked" id="sp-chk1"/>
                            <label for="sp-chk1">Messages</label>
                        </li>
                        <li>
                            <input type="checkbox" class="cbr cbr-primary" checked="checked" id="sp-chk2"/>
                            <label for="sp-chk2">Events</label>
                        </li>
                        <li>
                            <input type="checkbox" class="cbr cbr-primary" checked="checked" id="sp-chk3"/>
                            <label for="sp-chk3">Updates</label>
                        </li>
                        <li>
                            <input type="checkbox" class="cbr cbr-primary" checked="checked" id="sp-chk4"/>
                            <label for="sp-chk4">Server Uptime</label>
                        </li>
                    </ul>
                </div>

                <div class="links-block left-sep">
                    <h4>
                        <a href="#">
                            <span>Help Desk</span>
                        </a>
                    </h4>

                    <ul class="list-unstyled">
                        <li>
                            <a href="#">
                                <i class="fa-angle-right"></i>
                                Support Center
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa-angle-right"></i>
                                Submit a Ticket
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa-angle-right"></i>
                                Domains Protocol
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa-angle-right"></i>
                                Terms of Service
                            </a>
                        </li>
                    </ul>
                </div>

            </div>

        </div>

    </div>

</div>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a></div>
<div class="page-container">
    <!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

    <!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
    <!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
    <!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
    <div class="sidebar-menu toggle-others fixed" style="width:16%;">

        <div class="sidebar-menu-inner" style="font-size:12px;">

            <header class="logo-env">

                <!-- logo -->
                <div class="logo">
                    <a href="dashboard-1.html" class="logo-expanded">
                        <img  width="80" alt=""/>
                    </a>

                    <a href="dashboard-1.html" class="logo-collapsed">
                        <img src="../assets/images/logo-collapsed@2x.png" width="40" alt=""/>
                    </a>
                </div>

            </header>


            <ul id="main-menu" class="main-menu" style="padding-left:20px;padding-right:20px;">
                <!-- add class "multiple-expanded" to allow multiple submenus to open -->
                <!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
                <li class="active opened active">
                    <a href="dashboard-1.html">
                        <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="title">商品管理</span>
                    </a>
                    <ul>
                        <li class="active">
                            <a name="splb" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/splb/qrysplb.do?page=1&pageSize=15&purl=1')">
                                <span class="title">商品列表</span>
                            </a>
                        </li>
                        <li>
                            <a name="tjxsp" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/spfl/qryspfl.do?flag=1&purl=2')">
                                <span class="title">添加商品</span>
                            </a>
                        </li>
                        <li>
                            <a name="spfl" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/spfl/qryspfl.do?page=1&pageSize=15&purl=3')">
                                <span class="title">商品分类</span>
                            </a>
                        </li>
                        <li>
                            <a name="sphsz" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/sphsz/qrysphsz.do?page=1&pageSize=15&purl=4')">
                                <span class="title">商品回收站</span>
                            </a>
                        </li>
                        <li>
                            <a name="kcgl" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/form/qryform.do?page=1&pageSize=15&purl=5')">
                                <span class="title">订单列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="layout-variants.html">
                        <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="title">员工管理</span>
                    </a>
                    <ul>
                        <li>
                            <a name="yglb" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/yglb/qryyglb.do?page=1&pageSize=15&purl=6')">
                                <span class="title">员工列表</span>
                            </a>
                        </li>
                        <li>
                            <a name="xzyg" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/view/tjxyg.jsp?purl=7')">
                                <span class="title">添加员工</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="layout-variants.html">
                        <span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="title">会员管理</span>
                    </a>
                    <ul>
                        <li>
                            <a name="yglb" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/member/qrymember.do?page=1&pageSize=15&purl=8')">
                                <span class="title">会员列表</span>
                            </a>
                        </li>
                        <li>
                            <a name="xzyg" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/view/tjhy.jsp?purl=9')">
                                <span class="title">添加会员</span>
                            </a>
                        </li>
                        <%--<li>
                            <a name="jgyg" href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/discount/qrydiscount.do?purl=10')">
                                <span class="title">折扣设置</span>
                            </a>
                        </li>--%>
                    </ul>
                </li>
                <li>
                    <a href="layout-variants.html">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="title">权限管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/admin/qryadmin.do?page=1&pageSize=12&purl=11')">
                                <span class="title">管理员列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/role/qryallrole.do?page=1&pageSize=15&purl=12')">
                                <span class="title">添加管理员</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/role/qryrole.do?page=1&pageSize=12&purl=13')">
                                <span class="title">角色列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/role/qryallpower.do?purl=14')">
                                <span class="title">添加角色</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="layout-variants.html">
                        <span class="glyphicon glyphicon-tasks"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="title">统计图表</span>
                    </a>
                    <ul>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/stat/comm.do?purl=15')">
                                <span class="title">商品统计</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/stat/mem.do?purl=16')">
                                <span class="title">会员统计</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/stat/emp.do?purl=17')">
                                <span class="title">员工统计</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/stat/form.do?purl=18')">
                                <span class="title">订单统计</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="layout-variants.html">
                        <span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="title">系统设置</span>
                    </a>
                    <ul>
                        <li>
                            <a href="javascript:void(0)"
                               onclick="jumpTo('${pageContext.request.contextPath}/view/xgxx.jsp')">
                                <span class="title">修改密码</span>
                            </a>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <a href="javascript:void(0)" onclick="ilogout()">
                                <span class="title">退出登录</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
            </ul>

        </div>

    </div>

    <div id="main-content" style="width:100%;height:100%;background-color:#eee;">

        <div id="tools" class="card" style="width: 100%;height: 40px;background-color: #505050;">
            <%--<div style="height: 100%; width: 200px;">欢迎！${user.aname}<br>在线时间：
            </div>--%>
            <button style="float: right; height: 100%;margin-left: 6px; font-size: 16px;"
                    class="button button-longshadow-right button-lowercase button-tiny button-inverse "><span
                    class="glyphicon glyphicon-log-out" onclick="ilogout()"></span>
            </button>
            <button style="float: right; height: 100%;margin-left: 6px; font-size: 16px;"
                    class="button button-longshadow-right button-lowercase button-tiny button-inverse "><span
                    class="glyphicon glyphicon-refresh" onclick="irefresh()"></span>
            </button>
            <button style="float: right; height: 100%;margin-left: 6px; font-size: 16px;"
                    class="button button-longshadow-right button-lowercase button-tiny button-inverse "><span
                    class="glyphicon glyphicon-home" onclick="ihome()"></span>
            </button>
        </div>
        <br>
        <div id="content" class="main">
            <iframe frameborder="no" style="width:100%;height:98%;" class="viewiframe" id="main-iframe"
                    src="${pageContext.request.contextPath}/view/welcome.jsp" name="main"></iframe>
        </div>

    </div>

    <!-- start: Chat Section -->
    <div id="chat" class="fixed">

        <div class="chat-inner">


            <h2 class="chat-header">
                <a href="#" class="chat-close" data-toggle="chat">
                    <i class="fa-plus-circle rotate-45deg"></i>
                </a>

                Chat
                <span class="badge badge-success is-hidden">0</span>
            </h2>

            <script type="text/javascript">
                // Here is just a sample how to open chat conversation box
                jQuery(document).ready(function ($) {
                    var $chat_conversation = $(".chat-conversation");

                    $(".chat-group a").on('click', function (ev) {
                        ev.preventDefault();

                        $chat_conversation.toggleClass('is-open');

                        $(".chat-conversation textarea").trigger('autosize.resize').focus();
                    });

                    $(".conversation-close").on('click', function (ev) {
                        ev.preventDefault();
                        $chat_conversation.removeClass('is-open');
                    });
                });
            </script>


            <div class="chat-group">
                <strong>Favorites</strong>

                <a href="#"><span class="user-status is-online"></span> <em>Catherine J. Watkins</em></a>
                <a href="#"><span class="user-status is-online"></span> <em>Nicholas R. Walker</em></a>
                <a href="#"><span class="user-status is-busy"></span> <em>Susan J. Best</em></a>
                <a href="#"><span class="user-status is-idle"></span> <em>Fernando G. Olson</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Brandon S. Young</em></a>
            </div>


            <div class="chat-group">
                <strong>Work</strong>

                <a href="#"><span class="user-status is-busy"></span> <em>Rodrigo E. Lozano</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Robert J. Garcia</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Daniel A. Pena</em></a>
            </div>


            <div class="chat-group">
                <strong>Other</strong>

                <a href="#"><span class="user-status is-online"></span> <em>Dennis E. Johnson</em></a>
                <a href="#"><span class="user-status is-online"></span> <em>Stuart A. Shire</em></a>
                <a href="#"><span class="user-status is-online"></span> <em>Janet I. Matas</em></a>
                <a href="#"><span class="user-status is-online"></span> <em>Mindy A. Smith</em></a>
                <a href="#"><span class="user-status is-busy"></span> <em>Herman S. Foltz</em></a>
                <a href="#"><span class="user-status is-busy"></span> <em>Gregory E. Robie</em></a>
                <a href="#"><span class="user-status is-busy"></span> <em>Nellie T. Foreman</em></a>
                <a href="#"><span class="user-status is-busy"></span> <em>William R. Miller</em></a>
                <a href="#"><span class="user-status is-idle"></span> <em>Vivian J. Hall</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Melinda A. Anderson</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Gary M. Mooneyham</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Robert C. Medina</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Dylan C. Bernal</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Marc P. Sanborn</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Kenneth M. Rochester</em></a>
                <a href="#"><span class="user-status is-offline"></span> <em>Rachael D. Carpenter</em></a>
            </div>

        </div>

        <!-- conversation template -->
        <div class="chat-conversation">

            <div class="conversation-header">
                <a href="#" class="conversation-close">
                    &times;
                </a>

                <span class="user-status is-online"></span>
                <span class="display-name">Arlind Nushi</span>
                <small>Online</small>
            </div>

            <ul class="conversation-body">
                <li>
                    <span class="user">Arlind Nushi</span>
                    <span class="time">09:00</span>
                    <p>Are you here?</p>
                </li>
                <li class="odd">
                    <span class="user">Brandon S. Young</span>
                    <span class="time">09:25</span>
                    <p>This message is pre-queued.</p>
                </li>
                <li>
                    <span class="user">Brandon S. Young</span>
                    <span class="time">09:26</span>
                    <p>Whohoo!</p>
                </li>
                <li class="odd">
                    <span class="user">Arlind Nushi</span>
                    <span class="time">09:27</span>
                    <p>Do you like it?</p>
                </li>
            </ul>

            <div class="chat-textarea">
                <textarea class="form-control autogrow" placeholder="Type your message"></textarea>
            </div>

        </div>

    </div>
    <!-- end: Chat Section -->


</div>


<div class="page-loading-overlay">
    <div class="loader-2"></div>
</div>


<!-- Bottom Scripts -->
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/TweenMax.min.js"></script>
<script src="../assets/js/resizeable.js"></script>
<script src="../assets/js/joinable.js"></script>
<script src="../assets/js/xenon-api.js"></script>
<script src="../assets/js/xenon-toggles.js"></script>


<!-- Imported scripts on this page -->
<script src="../assets/js/xenon-widgets.js"></script>
<script src="../assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
<script src="../assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>
<script src="../assets/js/toastr/toastr.min.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="../assets/js/xenon-custom.js"></script>


</body>
</html>