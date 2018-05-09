<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <script>
        $(function () {
                //分页插件初始化
                $('#pagination').jqPaginator({
                    totalPages: ${pageCount},
                    visiblePages: 7,
                    currentPage: ${page},
                    first: '<li class="first"><a class="up" href="${pageContext.request.contextPath}/form/qryform.do?page=1&pageSize=${pageSize}">首页</a></li>',
                    prev: '<li class="prev"><a class="up" href="${pageContext.request.contextPath}/form/qryform.do?page=${page-1}&pageSize=${pageSize}">上一页</a></li>',
                    next: '<li class="next"><a class="down" href="${pageContext.request.contextPath}/form/qryform.do?page=${page+1}&pageSize=${pageSize}">下一页</a></li>',
                    last: '<li class="last"><a class="down" href="${pageContext.request.contextPath}/form/qryform.do?page=${pageCount}&pageSize=${pageSize}">末页</a></li>',
                    page: '<li class="page"><a href="${pageContext.request.contextPath}/form/qryform.do?page={{page}}&pageSize=${pageSize}">{{page}}</a></li>',
                    onPageChange: function (num) {
                        $('#text').html('当前第' + num + '页');
                    }
                });
                if (${page==1})
                    $(".up").attr("href", "javascript:void(0)");
                if (${pageCount==page})
                    $(".down").attr("href", "javascript:void(0)");
            }
        );
    </script>
</head>
<body>
<div id="main" style="background-color:#eee;">
    <br>
    <div style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
        <br>
        <div id="dtable" style="width:96%;height:100%;margin:0 auto;">
            <div id="divtable" class="divtable" style="background-color:#fff;">
                <table class="table table-hover table-condensed table-striped" id="commtable">
                    <thead>
                    <tr>
                        <th style="display:none">forid</th>
                        <th style="display:none">comid</th>
                        <th style="display:none">memid</th>
                        <th style="text-align:center;vertical-align:middle;">序号</th>
                        <th style="text-align:center;vertical-align:middle;">商品名称</th>
                        <th style="text-align:center;vertical-align:middle;">生产日期</th>
                        <th style="text-align:center;vertical-align:middle;">保质期</th>
                        <th style="text-align:center;vertical-align:middle;">单价</th>
                        <th style="text-align:center;vertical-align:middle;">数量</th>
                        <th style="text-align:center;vertical-align:middle;">总价</th>
                        <th style="text-align:center;vertical-align:middle;">下单人</th>
                        <th style="text-align:center;vertical-align:middle;">下单时间</th>
                        <th style="text-align:center;vertical-align:middle;">修改时间</th>
                        <th style="text-align:center;vertical-align:middle;">订单状态</th>
                        <th style="text-align:center;vertical-align:middle;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${forms}" var="form" varStatus="i">
                        <tr>
                            <td>${i.count}</td>
                            <td id="forid" style="display:none">${form.forid}</td>
                            <td id="comid" style="display:none">${form.comid}</td>
                            <td id="memid" style="display:none">${form.memid}</td>
                            <td>${form.cname}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${form.cprodate}"/></td>
                            <td>${form.month}</td>
                            <td>${form.cprice}</td>
                            <td>${form.ccount}</td>
                            <td>${form.ccount*form.cprice}</td>
                            <td>${form.mname}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${form.creattime}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${form.lastmoditime}"/></td>
                            <td><c:if test="${form.fstatus==0}">已下单</c:if>
                                <c:if test="${form.fstatus==1}">已发货</c:if>
                                <c:if test="${form.fstatus==2}">已收获</c:if>
                                <c:if test="${form.fstatus==3}">已关闭</c:if></td>

                            <td><c:if test="${form.fstatus==0}"><a
                                    href="${pageContext.request.contextPath}/form/updform.do?forid=${form.forid}&fstatus=1&page=${page}&pageSize=15"
                                    style="width:25px;">发货</a></c:if>
                                <c:if test="${form.fstatus!=3}"><a
                                        href="${pageContext.request.contextPath}/form/updform.do?forid=${form.forid}&fstatus=3&page=${page}&pageSize=15"
                                        style="width:25px;">关闭</a></c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="pagediv" style="width:95%;height:15%;">
            <ul class="pagination" id="pagination"></ul>
        </div>
    </div>
</div>


</body>
</html>
