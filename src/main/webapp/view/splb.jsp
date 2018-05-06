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
			    first: '<li class="first"><a style="font-size: 16px" class="up" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=1&pageSize=15">&laquo;</a></li>',
			    prev: '<li class="prev"><a style="font-size: 16px" class="up" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=${page-1}&pageSize=15">&lsaquo;</a></li>',
			    next: '<li class="next"><a style="font-size: 16px" class="down" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=${page+1}&pageSize=15">&rsaquo;</a></li>',
			    last: '<li class="last"><a style="font-size: 16px" class="down" href="${pageContext.request.contextPath}/splb/qrysplb.do?page=${pageCount}&pageSize=15">&raquo;</a></li>',
			    page: '<li class="page"><a style="font-size: 16px" href="${pageContext.request.contextPath}/splb/qrysplb.do?page={{page}}&pageSize=15">{{page}}</a></li>',
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
		function updateComm(){
			$("#form").submit();
		}
		
	</script>
	</head>
	<body>
		<div id="main" style="background-color:#eee;">
		<button class="button button-rounded button-small" data-dismiss="modal" onclick="changeView()">切换显示</button>
		<button class="button button-rounded button-small" data-dismiss="modal" onclick="javascript:location.reload()">刷新</button>
		<button class="button button-rounded button-small" data-dismiss="modal" onclick="javascript:location.reload()">导出</button>
			<br>
			<div style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
			<!-- 修改页面 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body" style="height:420px;width:600px;">
				<!-- 表单 -->
				<form id="form" method="post" class="bs-example bs-example-form" action="${pageContext.request.contextPath}/splb/updsplb.do?page=1&pageSize=15">
					<input type="hidden" id="ucomid" name="comid">
					<input type="hidden" name="fname" value="">
					<div class="card" style="float:left;background-color:white;height:200px;width:30%;">
						<img style="height:100%;width:100%;" id="cimg" onerror="this.src='../img/commodity/1.jpg'">
					</div>
					<div  style="float:left;height:400px;width:70%;">
					<table style="table-layout:fixed;">
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">商品名称：</td><td style="width:240px;"><input style="height:33px;" type="text" class="form-control" name="cname" id="cname" placeholder="请输入名称"></td><td style="width:50px;"></td></tr>
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">分类：</td><td style="width:240px;"><select style="height:28px;" class="form-control" name="finid" id="finid">
																																		<option>1</option>
																																		<option>2</option>
																																		<option>3</option>
																																		<option>4</option>
																																		<option>5</option>
																																	</select></td><td style="width:50px;"></td></tr>
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">重量：</td><td style="width:298px;"><div class="input-group"><input style="height:33px;width:100%;" type="text" class="form-control" name="cweight" id="cweight" placeholder="请输入名称"><span class="input-group-addon">克</span></div></td><td style="width:50px;"></td></tr>
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">单价：</td><td style="width:240px;"><div class="input-group"><input style="height:33px;" type="text" class="form-control" name="cprice" id="cprice" placeholder="请输入名称"><span class="input-group-addon">元</span></div></td><td style="width:50px;"></td></tr>
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">保质期：</td><td style="width:240px;"><div class="input-group"><input style="height:33px;" type="text" class="form-control" name="month" id="month" placeholder="请输入名称"><span class="input-group-addon">月</span></div></td><td style="width:50px;"></td></tr>
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">库存：</td><td style="width:240px;"><div class="input-group"><input style="height:33px;" type="text" class="form-control" name="cstock" id="cstock" placeholder="请输入名称"><span class="input-group-addon">个</span></div></td><td style="width:50px;"></td></tr>
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">生产商：</td><td style="width:240px;"><input style="height:33px;" type="text" class="form-control" name="cproder" id="cproder" placeholder="请输入名称"></td><td style="width:50px;"></td></tr>
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">生产日期：</td><td style="width:240px;"><input style="height:33px;" type="date" class="form-control" name="date" id="cprodate"></td><td style="width:50px;"></td></tr>
					<tr style="height:40px;"><td style="width:50px;"></td><td align="right" style="width:100px;font-size:14px;">描述：</td><td style="width:240px;"><div class="form-group"><textarea style="height:56px;" rows="2" class="form-control" name="cdesc" id="cdesc" placeholder="请输入不超过20字的描述"></textarea></div></td><td style="width:50px;"></td></tr>
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
			<div id="dimg" style="width:95%;height:100%; background-color:white;margin:0 auto;">
			<div id="divimg" style="display:none;margin:0 auto;padding-top:20px;" class="divtable">
				<c:forEach items="${list}" var="comm" varStatus="status">
				<div style="float:left;width:190px;height:250px;" onclick="qryDetail(${comm.comid})" data-toggle="modal" data-target="#myModal">
					<div class="card" style="cursor:pointer;float:left;width:170px;height:230px;">
						<img style="height:200px;width:170px;" alt="${comm.cname}" class="commimg" id="i${comm.comid}">
						<div style="height:50px;width:170px;">${comm.cname}&nbsp;&nbsp;${comm.cprice}元</div>
					</div>
				</div>
				</c:forEach>
			</div>
			</div>
			<br>
			<div id="dtable card" style="width:96%;height:100%;margin:0 auto;">
			<div id="divtable" class="divtable" style="background-color:#fff;">
			<table class="table table-hover table-condensed table-striped"  id="commtable">
				<thead>
				<tr>
					<th style="display:none">id</th>
					<th style="text-align:center;vertical-align:middle;">序号</th>
					<th style="text-align:center;vertical-align:middle;">商品名称</th>
					<th style="text-align:center;vertical-align:middle;">分类</th>
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
					<tr style="cursor:pointer;" onclick="qryDetail(${comm.comid})" data-toggle="modal" data-target="#myModal">
					    <td id="comid" style="display:none">${comm.comid}</td>
					    <td style="width:6%;">${status.count}</td>
					    <td style="width:12%;">${comm.cname}</td>
					    <td style="width:8%;">${comm.fname}</td>
					    <td style="width:7%;">${comm.cweight}g</td>
					    <td style="width:7%;">${comm.cprice}元</td>
					    <td style="width:8%;">${comm.month}个月</td>
					    <td style="width:6%;">${comm.ccode}</td>
					    <td style="width:7%;">${comm.cstock}</td>
					    <td style="width:7%;">${comm.cproder}</td>
					    <td style="width:18%;"><fmt:formatDate pattern="yyyy-MM-dd" value="${comm.cprodate}" /></td>
					    <td style="width:20%;"><a style="width:25px;height:20px;" href="${pageContext.request.contextPath}/splb/removecomm.do?comid=${comm.comid}&page=${page}&pageSize=15">x</a></td>
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
