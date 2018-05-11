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
                first: '<li class="first"><a class="up" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=1&pageSize=15">&laquo;</a></li>',
                prev: '<li class="prev"><a class="up" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${page-1}&pageSize=15">&lsaquo;</a></li>',
                next: '<li class="next"><a class="down" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${page+1}&pageSize=15">&lsaquo;</a></li>',
                last: '<li class="last"><a class="down" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${pageCount}&pageSize=15">&lsaquo;</a></li>',
                page: '<li class="page"><a href="${pageContext.request.contextPath}/yglb/qryyglb.do?page={{page}}&pageSize=15">{{page}}</a></li>',
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
                        <th style="display:none">empid</th>
                        <th style="text-align:center;vertical-align:middle;">工号</th>
                        <th style="text-align:center;vertical-align:middle;">姓名</th>
                        <th style="text-align:center;vertical-align:middle;">性别</th>
                        <th style="text-align:center;vertical-align:middle;">年龄</th>
                        <th style="text-align:center;vertical-align:middle;">入职时间</th>
                        <th style="text-align:center;vertical-align:middle;">电话</th>
                        <th style="text-align:center;vertical-align:middle;">工种</th>
                        <th style="text-align:center;vertical-align:middle;">邮箱</th>
                        <th style="text-align:center;vertical-align:middle;">薪水</th>
                        <th style="text-align:center;vertical-align:middle;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="emp">
                        <tr style="height:20px;">
                            <td id="comid" style="display:none">${emp.empid}</td>
                            <td style="width:4%;"><a href="javascript:void(0);" onclick="qryDetail(${emp.empid})" data-toggle="modal" data-target="#myModal">${emp.eno}</a></td>
                            <td style="width:6%;">${emp.ename}</td>
                            <td style="width:6%;"><c:if test="${emp.esex==1}">男</c:if>
                                <c:if test="${emp.esex==0}">女</c:if></td>
                            <td style="width:6%;">${emp.eage}岁</td>
                            <td style="width:15%;"><fmt:formatDate pattern="yyyy-MM-dd" value="${emp.etime}" /></td>
                            <td style="width:10%;">${emp.etel}</td>
                            <td style="width:6%;">
                                <c:if test="${emp.epro==1}">店长</c:if>
                                <c:if test="${emp.epro==2}">经理</c:if>
                                <c:if test="${emp.epro==3}">促销员</c:if>
                                <c:if test="${emp.epro==4}">收银员</c:if>
                                <c:if test="${emp.epro==5}">收货员</c:if>
                                <c:if test="${emp.epro==6}">理货员</c:if>
                                <c:if test="${emp.epro==7}">保洁</c:if>
                            </td>
                            <td style="width:15%;">${emp.email}</td>
                            <td style="width:6%;">${emp.esal}</td>
                            <td style=""><a style="width:25px;height:20px;" href="${pageContext.request.contextPath}/yglb/delyglb.do?empid=${emp.empid}&page=${page}&pageSize=15">x</a></td>
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
