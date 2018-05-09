<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/11
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/countUp.js"></script>
<script>
    $(function () {
        var options = {
            useEasing: true,
            useGrouping: true,
            separator: ',',
            decimal: '.',
        };
        var demo = new CountUp('d1', 0, 18, 0, 3, options);
        if (!demo.error) {
            demo.start();
        } else {
            console.error(demo.error);
        }
        var demo = new CountUp('d2', 0, 4518, 0, 3, options);
        if (!demo.error) {
            demo.start();
        } else {
            console.error(demo.error);
        }
        var demo = new CountUp('d3', 0, 4518, 0, 3, options);
        if (!demo.error) {
            demo.start();
        } else {
            console.error(demo.error);
        }
        var demo = new CountUp('d4', 0, 4518, 0, 3, options);
        if (!demo.error) {
            demo.start();
        } else {
            console.error(demo.error);
        }
    })
</script>
<style type="text/css">
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
<br>
<h1 style="text-align: center;font-size: 35px">欢迎使用超市管理系统</h1>



</body>
</html>
