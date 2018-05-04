<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <script>
        $(function(){
            //分页插件初始化
            $('#pagination1').jqPaginator({
                totalPages: ${pageCount},
                visiblePages: 7,
                currentPage: ${page},
                first: '<li class="first"><a class="up" href="${pageContext.request.contextPath}/role/qryrole.do?page=1&pageSize=15">首页</a></li>',
                prev: '<li class="prev"><a class="up" href="${pageContext.request.contextPath}/role/qryrole.do?page=${page-1}&pageSize=15">上一页</a></li>',
                next: '<li class="next"><a class="down" href="${pageContext.request.contextPath}/role/qryrole.do?page=${page+1}&pageSize=15">下一页</a></li>',
                last: '<li class="last"><a class="down" href="${pageContext.request.contextPath}/role/qryrole.do?page=${pageCount}&pageSize=15">末页</a></li>',
                page: '<li class="page"><a href="${pageContext.request.contextPath}/role/qryrole.do?page={{page}}&pageSize=15">{{page}}</a></li>',
                onPageChange: function (num) {
                    $('#text').html('当前第' + num + '页');
                }
            });
            if(${page==1})
                $(".up").attr("href","javascript:void(0)");
            if(${pageCount==page})
                $(".down").attr("href","javascript:void(0)");
        });
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
                        <th style="text-align:center;vertical-align:middle;">角色名称</th>
                        <th style="text-align:center;vertical-align:middle;">创建时间</th>
                        <th style="text-align:center;vertical-align:middle;">所有权限</th>
                        <th style="text-align:center;vertical-align:middle;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${roles}" var="role" varStatus="i">
                        <tr >
                            <td >${i.count}</td>
                            <td id="comid" style="display:none">${role.rid}</td>
                            <td >${role.rname}</td>
                            <td ><fmt:formatDate pattern="yyyy-MM-dd" value="${role.creattime}" /></td>
                            <td ></td>
                            <td ><a style="width:25px;height:20px;" href="${pageContext.request.contextPath}/role/delrole.do?aid=${role.rid}&page=${page}&pageSize=15">x</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="pagediv" style="width:95%;height:15%;">
            <ul class="pagination" id="pagination1"></ul>
        </div>
    </div>
</div>



</body>
</html>
