<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!doctype html>
<html>
	<head>
	<%@include file="../include/general.jsp" %>
	<link rel="stylesheet" href="../css/page/spfl.css">
	<script src="../js/page/spfl.js"></script>
	<script>
		$(function(){
			$('#pagination1').jqPaginator({
			    totalPages: 10,
			    visiblePages: 2,
			    currentPage: 1,
			    prev: '<li class="prev"><a class="up" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=${page-1}&pageSize=15">上一页</a></li>',
			    next: '<li class="next"><a class="down" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=${page+1}&pageSize=15">下一页</a></li>',
			    page: '<li class="page"><a href="${pageContext.request.contextPath}/splb/qrysplb.do?page={{page}}&pageSize=15">{{page}}</a></li>',
			    onPageChange: function (num) {
			    }
			});
		});
	
		function getFine(claid){
			$.ajax({
				url:"${pageContext.request.contextPath}/spfl/qryfine.do?page=1&claid="+claid,
				success:function(data){
					$("#finetb").children().remove();
					$("#commtb").children().remove();
					for(var i=0;i<data.length;i++){
						$("#finetb").append('<tr id="ftr'+i+'" onclick="getComm('+data[i].finid+')" style="cursor:pointer;height:20px;display:none;"><td id="claid" style="display:none">'+data[i].finid+'</td><td style="width:33%;">'+(i+1)+'</td><td style="width:33%;">'+data[i].fname+'</td><td style="width:33%;">'+data[i].fcode+'</td></tr>');
						$("#ftr"+i).fadeIn();
					}
				}
			});
		}
		function getComm(finid){
			$.ajax({
				url:"${pageContext.request.contextPath}/spfl/qrycomm.do?page=1&finid="+finid,
				success:function(data){
					$("#commtb").children().remove();
					for(var i=0;i<data.length;i++){
						$("#commtb").append('<tr id="ctr'+i+'" style="cursor:pointer;height:20px;display:none;"><td id="claid" style="display:none">'+data[i].claid+'</td><td style="width:33%;">'+(i+1)+'</td><td style="width:33%;">'+data[i].cname+'</td><td style="width:33%;">'+data[i].cprice+'元</td></tr>');
						$("#ctr"+i).fadeIn();
					}
				}
			});
		}
	</script>
	</head>
	<body>
	
		<button class="button button-rounded button-small" data-dismiss="modal" onclick="javascript:location.reload()">刷新</button><br>
		<div id="main" style="wdith:100%;height:100%;background-color:#eee;">
		<div id="tdiv1" class="tdiv">
			<table class="table table-hover table-condensed table-striped"  id="commtable">
				<thead>
				<tr>
					<th style="display:none">id</th>
					<th>序号</th>
					<th>名称</th>
					<th>编码</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listclazz}" var="clazz" varStatus="status">
					<tr style="height:20px;cursor:pointer;" onclick="getFine(${clazz.claid})">
					    <td id="claid" style="display:none">${clazz.claid}</td>
					    <td style="width:33%;">${status.count}</td>
					    <td style="width:33%;">${clazz.cname}</td>
					    <td style="width:33%;">${clazz.ccode}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="tdiv2" class="tdiv">
			<table class="table table-hover table-condensed table-striped"  id="commtable">
				<thead>
				<tr>
					<th style="display:none">id</th>
					<th>序号</th>
					<th>名称</th>
					<th>编码</th>
					</tr>
				</thead>
				<tbody id="finetb">
					<%-- <c:forEach items="${listfine}" var="fine" varStatus="status">
					<tr style="height:20px;">
					    <td id="claid" style="display:none">${fine.findi}</td>
					    <td style="width:33%;">${status.count}</td>
					    <td style="width:33%;">${fine.fname}</td>
					    <td style="width:33%;">${fine.fcode}</td>
					</tr>
					</c:forEach> --%>
				</tbody>
			</table>
		</div>
		<div id="tdiv3" class="tdiv">
			<table class="table table-hover table-condensed table-striped"  id="commtable">
				<thead>
				<tr>
					<th style="display:none">id</th>
					<th>序号</th>
					<th>名称</th>
					<th>价格</th>
					</tr>
				</thead>
				<tbody id="commtb">
					<%-- <c:forEach items="${listcomm}" var="comm" varStatus="status">
					<tr style="height:20px;">
					    <td id="claid" style="display:none">${comm.comid}</td>
					    <td style="width:33%;">${status.count}</td>
					    <td style="width:33%;">${comm.cname}</td>
					    <td style="width:33%;">${comm.cprice}</td>
					</tr>
					</c:forEach> --%>
				</tbody>
			</table>
		</div>
		</div>
	</body>
</html>
