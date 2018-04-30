<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<%@include file="../include/general.jsp" %>
	<link rel="stylesheet" href="../css/page/tjxsp.css">
	<script src="../js/page/tjxsp.js"></script>
	<script>
		function addComm(){
			$("#form").submit();
		}
	</script>
</head>
<body><br>
	<div id="main" style="width:98%;height:100%;">
		<br>
		<div style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
		<br>
		<div id="formdiv" style="width:100%;height:100%;">
			<form id="form" action="tjxsp.jsp" class="form-horizontal" role="form" autocomplete="on">
			  <div class="form-group">
			    <span for="cname" class="col-sm-2 control-label">商品名称：</span>
			    <div class="col-sm-3" >
			      <input autofocus type="text" pattern="[A-Za-z]{5}" class="form-control" id="cname" name="cname" placeholder="请输入40字以内的商品名称">
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="finid" class="col-sm-2 control-label">类别：</span>
			    <div class="col-sm-3">
				    <select class="form-control" name="finid" id="finid">
				      <option>1</option>
				      <option>2</option>
				      <option>3</option>
				      <option>4</option>
				      <option>5</option>
				    </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="cspec" class="col-sm-2 control-label">规格：</span>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="cspec" name="cspec" placeholder="请输入规格">
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="cweight" class="col-sm-2 control-label">重量：</span>
			    <div class="col-sm-3">
			      <div class="input-group"><input type="text" class="form-control" id="cweight" name="cweight" placeholder="请输入商品重量"><span class="input-group-addon">克</span></div>
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="cprice" class="col-sm-2 control-label">价格：</span>
			    <div class="col-sm-3">
			      <div class="input-group"><input type="text" class="form-control" id="cprice" name="cprice" placeholder="请输入商品价格"><span class="input-group-addon">元</span></div>
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="cproder" class="col-sm-2 control-label">生产商：</span>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="cproder" name="cproder" placeholder="请输入生产商">
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="cprodate" class="col-sm-2 control-label">生产日期：</span>
			    <div class="col-sm-3">
			      <input type="date" class="form-control" id="cprodate" name="cprodate">
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="month" class="col-sm-2 control-label">保质期：</span>
			    <div class="col-sm-3">
			      <div class="input-group"><input type="text" class="form-control" id="month" name="month" placeholder="请输入保质期"><span class="input-group-addon">月</span></div>
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="ccode" class="col-sm-2 control-label">代码：</span>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="ccode" name="ccode" placeholder="请输入商品代码，只能为数字">
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="cstock" class="col-sm-2 control-label">库存：</span>
			    <div class="col-sm-3">
			      <div class="input-group"><input type="text" class="form-control" id="cstock" name="cstock" placeholder="请输入库存数量"><span class="input-group-addon">个</span></div>
			    </div>
			  </div>
			  <div class="form-group">
			    <span for="cdesc" class="col-sm-2 control-label">描述：</span>
			    <div class="col-sm-3">
			      <textarea class="form-control" id="cdesc" name="cdesc" placeholder="请输入不超过20字的描述"></textarea>
			    </div>
			  </div>
			  <button type="button" class="button button-rounded button-small" data-dismiss="modal" onclick="javascript:location.reload()">刷新</button>
			  <button type="button" class="button button-rounded button-small" data-dismiss="modal">重置</button>
			  <button type="button" onclick="addComm()" class="button button-rounded button-small button-primary button-glow">提交</button>
			</form>
		</div>	
		<br>
		</div>
	</div>
	
</body>
</html>