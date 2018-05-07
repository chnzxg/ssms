<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <link rel="stylesheet" href="../css/page/splb.css">
    <script>
        $(function(){
            //分页插件初始化
            $('#pagination').jqPaginator({
                totalPages: ${pageCount},
                visiblePages: 7,
                currentPage: ${page},
                first: '<li class="first"><a class="up" href="${pageContext.request.contextPath}/admin/qryadmin.do?page=1&pageSize=${pageSize}">首页</a></li>',
                prev: '<li class="prev"><a class="up" href="${pageContext.request.contextPath}/admin/qryadmin.do?page=${page-1}&pageSize=${pageSize}">上一页</a></li>',
                next: '<li class="next"><a class="down" href="${pageContext.request.contextPath}/admin/qryadmin.do?page=${page+1}&pageSize=${pageSize}">下一页</a></li>',
                last: '<li class="last"><a class="down" href="${pageContext.request.contextPath}/admin/qryadmin.do?page=${pageCount}&pageSize=${pageSize}">末页</a></li>',
                page: '<li class="page"><a href="${pageContext.request.contextPath}/admin/qryadmin.do?page={{page}}&pageSize=${pageSize}">{{page}}</a></li>',
                onPageChange: function (num) {
                    $('#text').html('当前第' + num + '页');
                }
            });
            if(${page==1})
                $(".up").attr("href","javascript:void(0)");
            if(${pageCount==page})
                $(".down").attr("href","javascript:void(0)");
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
                <table class="table table-hover table-condensed table-striped"  id="commtable">
                    <thead>
                    <tr>
                        <th style="display:none">aid</th>
                        <th style="text-align:center;vertical-align:middle;">序号</th>
                        <th style="text-align:center;vertical-align:middle;">账号</th>
                        <th style="text-align:center;vertical-align:middle;">创建时间</th>
                        <th style="text-align:center;vertical-align:middle;">最后登录时间</th>
                        <th style="text-align:center;vertical-align:middle;">拥有角色</th>
                        <th style="text-align:center;vertical-align:middle;">所有权限</th>
                        <th style="text-align:center;vertical-align:middle;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${admins}" var="admin" varStatus="i">
                        <tr>
                            <td >${i.count}</td>
                            <td id="comid" style="display:none">${admin.aid}</td>
                            <td >${admin.aname}</td>
                            <td ><fmt:formatDate pattern="yyyy-MM-dd" value="${admin.creattime}" /></td>
                            <td ><fmt:formatDate pattern="yyyy-MM-dd" value="${admin.lastlogintime}" /></td>
                            <td ></td>
                            <td ></td>
                            <td ><a style="width:25px;" href="${pageContext.request.contextPath}/admin/deladmin.do?aid=${admin.aid}&page=${page}&pageSize=${pageSize}">x</a></td>
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