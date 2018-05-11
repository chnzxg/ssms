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
            location.href = '${pageContext.request.contextPath}/member/delmember.do?memid='+id+'&page=${page}&pageSize=15';
        }
        $(function () {
                //分页插件初始化
                $('#pagination1').jqPaginator({
                    totalPages: ${pageCount},
                    visiblePages: 7,
                    currentPage: ${page},
                    first: '<li class="first"><a style="font-size: 16px" class="up" href="${pageContext.request.contextPath}/member/qrymember.do?page=1&pageSize=15">&laquo;</a></li>',
                    prev: '<li class="prev"><a style="font-size: 16px" class="up" href="${pageContext.request.contextPath}/member/qrymember.do?page=${page-1}&pageSize=15">&lsaquo;</a></li>',
                    next: '<li class="next"><a style="font-size: 16px" class="down" href="${pageContext.request.contextPath}/member/qrymember.do?page=${page+1}&pageSize=15">&rsaquo;</a></li>',
                    last: '<li class="last"><a style="font-size: 16px" class="down" href="${pageContext.request.contextPath}/member/qrymember.do?page=${pageCount}&pageSize=15">&raquo;</a></li>',
                    page: '<li class="page"><a style="font-size: 16px" href="${pageContext.request.contextPath}/member/qrymember.do?page={{page}}&pageSize=15">{{page}}</a></li>',
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
    <div class="search-div card2">
        <div style="float: right;">
            <form class="form-inline" role="form" autocomplete="off"
                  method="get"
                  action="${pageContext.request.contextPath}/member/qrymember.do"
            >
                <input type="hidden" name="page" value="${page}">
                <input type="hidden" name="pageSize" value="15">
                <div class="form-group ">
                    <label for="f1">名称</label>
                    <input name="mname" value="${member.mname}" type="text" id="f1" class="form-control" placeholder="请输入名称"/>
                </div>&nbsp;&nbsp;
                <div class="form-group">
                    <label for="f2">电话</label>
                    <input name="mtel" value="${member.mtel}" type="text" id="f2" class="form-control" placeholder="请输入电话"/>
                </div>&nbsp;&nbsp;
                <div class="form-group">
                    <label for="f3">状态</label>
                    <select id="f3" class="form-control" name="mlevel">
                        <option>全部</option>
                        <option <c:if test="${member.mlevel==1}">selected</c:if> value="1">1</option>
                        <option <c:if test="${member.mlevel==2}">selected</c:if> value="2">2</option>
                        <option <c:if test="${member.mlevel==3}">selected</c:if> value="3">3</option>
                        <option <c:if test="${member.mlevel==4}">selected</c:if> value="4">4</option>
                        <option <c:if test="${member.mlevel==5}">selected</c:if> value="5">5</option>
                        <option <c:if test="${member.mlevel==6}">selected</c:if> value="6">6</option>
                        <option <c:if test="${member.mlevel==7}">selected</c:if> value="7">7</option>
                        <option <c:if test="${member.mlevel==8}">selected</c:if> value="8">8</option>
                        <option <c:if test="${member.mlevel==9}">selected</c:if> value="9">9</option>
                        <option <c:if test="${member.mlevel==10}">selected</c:if> value="10">10</option>
                    </select>
                </div>&nbsp;&nbsp;
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">搜索</button>&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </form>
        </div>
    </div>
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
                        此操作会删除会员且无法恢复，是否继续？
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
        <div id="dtable card2" style="width:96%;height:100%;margin:0 auto;">
            <div id="divtable" class="divtable" style="background-color:#fff;">
                <table class="table table-hover table-condensed table-striped" id="commtable">
                    <thead>
                    <tr>
                        <th style="display:none">memid</th>
                        <th style="text-align:center;vertical-align:middle;">序号</th>
                        <th style="text-align:center;vertical-align:middle;">会员名称</th>
                        <th style="text-align:center;vertical-align:middle;">电话</th>
                        <th style="text-align:center;vertical-align:middle;">会员等级</th>
                        <th style="text-align:center;vertical-align:middle;">余额</th>
                        <th style="text-align:center;vertical-align:middle;">创建时间</th>
                        <th style="text-align:center;vertical-align:middle;">总消费金额</th>
                        <th style="text-align:center;vertical-align:middle;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${members}" var="member" varStatus="i">
                        <tr>
                            <th style="display:none">${member.memid}</th>
                            <td>${i.count}</td>
                            <td>${member.mname}</td>
                            <td>${member.mtel}</td>
                            <td>${member.mlevel}</td>
                            <td>${member.mrem}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.mdate}"/></td>
                            <td>${member.mcount}</td>
                            <td style="width: 10%;"><a
                                   onclick="del1(${member.memid})"
                                   data-toggle="modal"
                                   data-target="#myModal1"
                                   href="javascript:void(0)"><b
                                    style="font-size: 16px; color: red;">&times;</b></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="pagediv" style="width:95%;height:15%;">
            <ul class="pagination" id="pagination1"></ul>
            <div style="float: right; margin-top: 20px">
                <a class="button button-rounded button-small" data-dismiss="modal"
                   onclick="report(this,'commtable','会员列表')">导出
                </a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
