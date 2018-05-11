<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            location.href = '${pageContext.request.contextPath}/role/delrole.do?rid='+id+'&page=${page}&pageSize=12';
        }
        $(function(){
            //分页插件初始化
            $('#pagination1').jqPaginator({
                totalPages: ${pageCount},
                visiblePages: 7,
                currentPage: ${page},
                first: '<li class="first"><a style="font-size: 16px" class="up" href="${pageContext.request.contextPath}/role/qryrole.do?page=1&pageSize=15">&laquo;</a></li>',
                prev: '<li class="prev"><a style="font-size: 16px" class="up" href="${pageContext.request.contextPath}/role/qryrole.do?page=${page-1}&pageSize=15">&lsaquo;</a></li>',
                next: '<li class="next"><a style="font-size: 16px" class="down" href="${pageContext.request.contextPath}/role/qryrole.do?page=${page+1}&pageSize=15">&rsaquo;</a></li>',
                last: '<li class="last"><a style="font-size: 16px" class="down" href="${pageContext.request.contextPath}/role/qryrole.do?page=${pageCount}&pageSize=15">&raquo;</a></li>',
                page: '<li class="page"><a style="font-size: 16px" href="${pageContext.request.contextPath}/role/qryrole.do?page={{page}}&pageSize=15">{{page}}</a></li>',
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
<div id="main"style="background-color:#eee;">
    <div class="card2" style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
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
                            <td id="comid" style="display:none">${role.rid}</td>
                            <td >${i.count}</td>
                            <td >${role.rname}</td>
                            <td ><fmt:formatDate pattern="yyyy-MM-dd" value="${role.creattime}" /></td>
                            <td><div style=" margin:0 auto;width: 450px; height: 32px; overflow-y:auto; overflow-x:auto;">${role.powers}</div></td>
                            <td style="width: 10%"><a
                                    onclick="del1(${role.rid})"
                                    data-toggle="modal"
                                    data-target="#myModal1"
                                    href="javascript:void(0)"><b style="font-size: 16px; color: red;">&times;</b></a></td>
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
