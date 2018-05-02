<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/1
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/js/echarts/echarts.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page/statcomm.css"/>
<script>

    var myChart = echarts.init(document.getElementById('div1'));

    var option = {
        backgroundColor: '#2c343c',
        textStyle: {
            color: 'rgba(255, 255, 255, 0.3)'
        },
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: '55%',
                data: [
                    {value: 400, name: '搜索引擎'},
                    {value: 335, name: '直接访问'},
                    {value: 310, name: '邮件营销'},
                    {value: 274, name: '联盟广告'},
                    {value: 235, name: '视频广告'}
                ],
                roseType: 'angle',

                itemStyle: {
                    emphasis: {
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },
                label: {
                    normal: {
                        textStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        }
                    }
                }

            }
        ]
    }


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

</script>
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
            data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
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
                data: [
                    {value: 235, name: '视频广告'},
                    {value: 274, name: '联盟广告'},
                    {value: 310, name: '邮件营销'},
                    {value: 335, name: '直接访问'},
                    {value: 400, name: '搜索引擎'}
                ],
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
