<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!doctype html>
<html>
	<head>
	<%@include file="../include/general.jsp" %>
	<link rel="stylesheet" href="../css/page/yglb.css">
	<script src="../js/page/yglb.js"></script>
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
	});
	function qryDetail(empid){
		$.ajax({
			url:"${pageContext.request.contextPath}/yglb/qryDetail.do?empid="+empid,
			success:function(data){
				$("#myModalLabel").text(data.ename);
				$("#eno").val(data.eno);
				$("#ename").val(data.ename);
				if(data.esex=="1")
					$("#radio1").iCheck('check')
				else
					$("#radio0").iCheck('check')
				$("#eage").val(data.eage);
				$("#etime").val(data.etime);
				$("#etel").val(data.etel);
				$("#epro").val(data.epro);
				$("#email").val(data.email);
				$("#esal").val(data.esal);
				$("#eimg").attr("src","../img/employee/"+data.empid+".jpg");
			}
		});
	}
	</script>
	</head>
	<body>
		<div id="main" style="background-color:#eee;">
		<button class="button button-rounded button-small" data-dismiss="modal" onclick="javascript:location.reload()">刷新</button><br>
		<!-- 修改页面 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel"></h4>
		</div>
		<div class="modal-body" style="margin-left:50px;height:420px;width:600px;">
			<!-- 表单 -->
			<form id="form" class="bs-example bs-example-form" action="${pageContext.request.contextPath}/yglb/updyglb.do">
				<input type="hidden" name="firstRow" value="">
				<input type="hidden" name="pageSize" value="">
				<input type="hidden" name="empid" value="">
				<div class="card" style="float:left;background-color:white;height:200px;width:30%;">
					<img style="height:100%;width:100%;" id="eimg" onerror="this.src='../img/fali.jpg'">
				</div>
				<div  style="margin:0 auto;height:400px;width:70%;">
				<table style="table-layout:fixed;">
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">工号：</td><td style="width:240px;"><input style="height:28px;" type="text" class="form-control" name="eno" id="eno" disabled></td><td style="width:50px;"></td></tr>
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">姓名：</td><td style="width:240px;"><input style="height:28px;" type="text" class="form-control" name="ename" id="ename" placeholder="请输入姓名"></td><td style="width:50px;"></td></tr>
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">性别：</td><td style="width:240px;text-align:left;">
																																	<input type="radio" id="radio1" name="esex" value="1">男&nbsp;&nbsp;&nbsp;&nbsp;
																																	<input type="radio" id="radio0" name="esex" value="0">女
																																</td></tr>
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">年龄：</td><td style="width:240px;"><div class="input-group"><input style="height:28px;width:100%;" type="text" class="form-control" name="eage" id="eage" placeholder="请输入年龄"><span class="input-group-addon">岁</span></div></td><td style="width:50px;"></td></tr>
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">入职：</td><td style="width:240px;"><input style="height:28px;" type="date" class="form-control" name="etime" id="etime" placeholder="请输入入职时间" disabled></td><td style="width:50px;"></td></tr>
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">电话：</td><td style="width:240px;"><input style="height:28px;" type="text" class="form-control" name="etel" id="etel" placeholder="请输入电话号码"></td><td style="width:50px;"></td></tr>
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">工种：</td><td style="width:240px;"><select style="height:28px;" class="form-control" name="epro" id="epro">
																																	<option value ="1">店长</option>
																																	<option value ="2">经理</option>
																																	<option value ="3">促销员</option>
																																	<option value ="4">收银员</option>
																																	<option value ="5">收货员</option>
																																	<option value ="6">理货员</option>
																																	<option value ="7">保洁</option>
																																</select></td><td style="width:50px;"></td></tr>
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">邮箱：</td><td style="width:240px;"><input style="height:28px;" type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱"></td><td style="width:50px;"></td></tr>
				<tr style="height:34px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">薪水：</td><td style="width:240px;"><input style="height:28px;" type="text" class="form-control" name="esal" id="esal" placeholder="请输入薪水"></td><td style="width:50px;"></td></tr>
				</table>
				</div>
			</form>
		</div>
		<div class="modal-footer">
		<button type="button" class="button button-rounded button-small" data-dismiss="modal">关闭</button>
		<button type="button" onclick="updateComm()" class="button button-rounded button-small button-primary button-glow">提交</button>
		</div>
		</div><!-- /.modal-content -->
		</div><!-- /.modal -->
		</div>
			<div id="dtable" style="width:96%;height:100%;margin:0 auto;">
			<div id="divtable" class="divtable">
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
				<!--  <a href="#" style="float:right" class="button button-primary button-small button-glow button-border">新增</a>  -->
			</div>
			<div class="pagediv" style="float:left;width:100%;height:15%;">
				<ul class="pagination" id="pagination1"></ul>
			</div>
			</div>
			
		</div>
	</body>
</html>
