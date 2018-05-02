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
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="div1" style="float: left;width: 40%;height: 400px;background-color: white;margin: 0px;padding: 40px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('div1'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data: ['销量']
        },
        xAxis: {
            data: ${CommodityInfoNames}
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: ${CommodityInfoValues}
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<div id="div2" style="float: left;width: 40%;height: 400px;background-color: white;margin: 0px;padding: 40px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('div2'));
    var option = {
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: '55%',
                data: ${CommodityInfo},
                roseType: 'angle',
                itemStyle: {
                    normal: {
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    myChart.setOption(option);
</script>
</body>
</html>