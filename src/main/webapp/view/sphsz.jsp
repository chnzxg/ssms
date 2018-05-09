<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <link rel="stylesheet" href="../css/page/splb.css">
    <script src="../js/page/splb.js"></script>
    <script>
        $(function(){
            //分页插件初始化
            $('#pagination1').jqPaginator({
                totalPages: ${pageCount},
                visiblePages: 7,
                currentPage: ${page},
                first: '<li class="first"><a class="up" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=1&pageSize=15">首页</a></li>',
                prev: '<li class="prev"><a class="up" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=${page-1}&pageSize=15">上一页</a></li>',
                next: '<li class="next"><a class="down" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=${page+1}&pageSize=15">下一页</a></li>',
                last: '<li class="last"><a class="down" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=${pageCount}&pageSize=15">末页</a></li>',
                page: '<li class="page"><a href="${pageContext.request.contextPath}/splb/qrysplb.do?page={{page}}&pageSize=15">{{page}}</a></li>',
                onPageChange: function (num) {
                    $('#text').html('当前第' + num + '页');
                }
            });
            if(${page==1})
                $(".up").attr("href","javascript:void(0)");
            if(${pageCount==page})
                $(".down").attr("href","javascript:void(0)");
            //图片加载失败时的默认显示
            $("img").on("error", function () {
                $(this).attr("src", "../img/fail.jpg");
            });


            var imgs = $(".commimg");
            for(var i=0;i<imgs.length;i++){
                var id = $(imgs[i]).attr("id");
                id = id.substring(1);
                $(imgs[i]).attr("src","${pageContext.request.contextPath}/img/commodity/"+id+".jpg");
            }
        });
        function qryDetail(comid){
            $.ajax({
                url:"${pageContext.request.contextPath}/splb/qryDetail.do?comid="+comid,
                success:function(data){
                    $("#myModalLabel").text(data.cname);
                    $("#cname").val(data.cname);
                    $("#finid").val(data.finid);
                    $("#cspec").val(data.cspec);
                    $("#cweight").val(data.cweight);
                    $("#cprice").val(data.cprice);
                    $("#month").val(data.month);
                    $("#ccode").val(data.ccode);
                    $("#cstock").val(data.cstock);
                    $("#cproder").val(data.cproder);
                    $("#cprodate").val(dformat(data.cprodate));
                    $("#cdesc").val(data.cdesc);
                    $("#ucomid").val(data.comid);
                    $("#cimg").attr("src","../img/commodity/"+data.comid+".jpg");
                }
            });
        }
        function changeView(){
            if($("#divimg").css("display")=="none"){
                $("#divtable").fadeOut();
                $("#divimg").fadeIn();
            }
            else{
                $("#divimg").fadeOut();
                $("#divtable").fadeIn();
            }
        }
        function delComm1(comid) {
            $('#delcomid').val(comid);
        }
        function delComm2() {
            var comid = $('#delcomid').val();
            location.href = '${pageContext.request.contextPath}/splb/delsplb.do?comid=' + comid + '&page=${page}&pageSize=15';
        }

    </script>
</head>
<body>
<div id="main" style="background-color:#eee;">
    <div style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
        <br>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel1">
                            注意
                        </h4>
                    </div>
                    <input id="delcomid" type="hidden" value="">
                    <div class="modal-body">
                        这会将此商品永久删除且无法恢复，是否继续？
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="delComm2()">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <div id="dtable" style="width:96%;height:100%;margin:0 auto;">
            <div id="divtable" class="divtable" style="background-color:#fff;">
                <table class="table table-hover table-condensed table-striped"  id="commtable">
                    <thead>
                    <tr>
                        <th style="display:none">id</th>
                        <th style="text-align:center;vertical-align:middle;">序号</th>
                        <th style="text-align:center;vertical-align:middle;">商品名称</th>
                        <th style="text-align:center;vertical-align:middle;">分类</th>
                        <th style="text-align:center;vertical-align:middle;">规格</th>
                        <th style="text-align:center;vertical-align:middle;">重量</th>
                        <th style="text-align:center;vertical-align:middle;">单价</th>
                        <th style="text-align:center;vertical-align:middle;">保质期</th>
                        <th style="text-align:center;vertical-align:middle;">代码</th>
                        <th style="text-align:center;vertical-align:middle;">库存</th>
                        <th style="text-align:center;vertical-align:middle;">生产商</th>
                        <th style="text-align:center;vertical-align:middle;">生产日期</th>
                        <th style="text-align:center;vertical-align:middle;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="comm" varStatus="status">
                        <tr style="height:20px;">
                            <td id="comid" style="display:none">${comm.comid}</td>
                            <td style="width:6%;">${status.count}</td>
                            <td style="width:12%;"><a href="javascript:void(0);" onclick="qryDetail(${comm.comid})" data-toggle="modal" data-target="#myModal">${comm.cname}</a></td>
                            <td style="width:8%;">${comm.fname}</td>
                            <td style="width:7%;">${comm.cspec}</td>
                            <td style="width:7%;">${comm.cweight}g</td>
                            <td style="width:7%;">${comm.cprice}元</td>
                            <td style="width:8%;">${comm.month}个月</td>
                            <td style="width:6%;">${comm.ccode}</td>
                            <td style="width:7%;">${comm.cstock}</td>
                            <td style="width:7%;">${comm.cproder}</td>
                            <td style="width:18%;"><fmt:formatDate pattern="yyyy-MM-dd" value="${comm.cprodate}"/></td>
                            <td style="width:20%;"><a style="width:25px;height:20px;"
                                                      href="javascript:void(0)" onclick="delComm1(${comm.comid})"
                                                      data-toggle="modal"
                                                      data-target="#myModal1"><b style="font-size: 16px; color: red;">&times;</b></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!--  <a href="#" style="float:right" class="button button-primary button-small button-glow button-border">新增</a>  -->
            </div>
        </div>
        <div class="pagediv" style="width:95%;height:15%;">
            <ul class="pagination" id="pagination1"></ul>
        </div>
    </div>
</div>



</body>
</html>
