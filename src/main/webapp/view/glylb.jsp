<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <script>
        function del1(id) {
            $('#delvalue').val(id);
        }
        function del2() {
            var id = $('#delvalue').val();
            location.href = '${pageContext.request.contextPath}/admin/deladmin.do?aid=' + id + '&page=${page}&pageSize=15';
        }
        $(function () {
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
                if (${page==1})
                    $(".up").attr("href", "javascript:void(0)");
                if (${pageCount==page})
                    $(".down").attr("href", "javascript:void(0)");
            }
        );
    </script>
    <style type="text/css">
        .col-sm-4 {
            margin-bottom: 10px;
        }

        .col-sm-6 {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div id="main" style="background-color:#eee;">
    <br>
    <div style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
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
                    <input id="delvalue" type="hidden" value="">
                    <div class="modal-body">
                        此操作会删除管理员且无法恢复，是否继续？
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="del2()">
                            确定
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <br>
        <div id="dtable" style="width:96%;height:100%;margin:0 auto;">
            <div id="divtable" class="divtable" style="background-color:#fff;">
                <table class="table table-hover table-condensed table-striped" id="commtable">
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
                        <tr <c:if test="${admin.aid==sessionScope.user.aid}">style="background-color: #CCCCCC"</c:if>>
                            <td>${i.count}</td>
                            <td id="comid" style="display:none">${admin.aid}</td>
                            <td><a <c:if
                                    test="${admin.aid==sessionScope.user.aid}"> href="javascript:return false;"</c:if>
                                    <c:if test="${admin.aid!=sessionScope.user.aid}">href="${pageContext.request.contextPath}/admin/qrydetail.do?aid=${admin.aid}"</c:if>>${admin.aname}</a>
                            </td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${admin.creattime}"/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${admin.lastlogintime}"/></td>
                            <td>
                                <div style="margin:0 auto;width: 200px; height: 32px; overflow-y:auto; overflow-x:auto;">${admin.roles}</div>
                            </td>
                            <td>
                                <div style="margin:0 auto;width: 400px; height: 32px; overflow-y:auto; overflow-x:auto;">${admin.powers}</div>
                            </td>
                            <td><a style="width:25px;"
                                   <c:if test="${admin.aid==sessionScope.user.aid}">href="javascript:return false;"
                                   style="opacity: 0.2"</c:if>
                                   <c:if test="${admin.aid!=sessionScope.user.aid}">href="javascript:void(0)"
                                   onclick="del1(${admin.aid})"
                                   data-toggle="modal"
                                   data-target="#myModal1"</c:if>
                            ><b style="font-size: 16px; color: red;">&times;</b></a></td>
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
