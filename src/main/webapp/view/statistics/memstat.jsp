<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/1
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/general.jsp" %>
<script src="${pageContext.request.contextPath}/js/echarts/echarts.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page/statcomm.css"/>
<html style="width: 100%;height: 100%;">
<head>
    <title>Title</title>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom --><br>
<div id="div1" style="float: left;width: 42%;height: 80%;background-color: white;margin-left: 70px; margin-top: 40px;padding: 0px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('div1'));
    // 指定图表的配置项和数据
    var option = {
        tooltip: {},
        legend: {
            data: ['会员']
        },
        xAxis: {
            data: ${MemberInfoNames}
        },
        yAxis: {},
        /*itemStyle: {
         normal: {
         emphasis: {
         shadowBlur: 10,
         shadowOffsetX: 0,
         shadowColor: 'rgba(0, 0, 0, 0.5)'
         },
         color: 'black'
         }
         },*/

        series: [{
            name: '会员',
            type: 'bar',
            data: ${MemberInfoValues}
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<div id="div2" style="float: left;width: 42%;height: 80%;background-color: white;margin-left: 70px; margin-top: 40px;padding: 0px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('div2'));
    var option = {
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: '55%',
                data: ${MemberInfo},
                itemStyle: {
                    normal: {
                        shadowBlur: 0,
                        shadowColor: 'rgba(0, 0, 0, 00)'
                    }
                }
            }
        ]
    };
    myChart.setOption(option);
</script>
</body>
</html>
