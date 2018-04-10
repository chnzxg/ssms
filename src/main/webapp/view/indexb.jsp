<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js">
<head>
<%@include file="../include/general.jsp" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>超市管理系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="../css/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/app.js"></script>
<script>
//点击后打开标签
function openTag(obj){
	var a = $(obj).text();
	var b = $(obj).attr("name");
	var Tags = $(".tagbtn");
		if(checkTag(b)){
			if(Tags.length>=8)
				alert("最多同时打开8个页签");
			else{
				$(".daohang ul").append('<li><button type="button" name= "'+b+'" onclick="changeIFrame(this)" class="am-btn am-btn-default am-radius am-btn-xs tagbtn">'+a+'<a href="javascript: void(0)" class="am-close am-close-spin"data-am-modal-close="" onclick="closeTag(this)">×</a></button></li>');
				if(b=="splb"||b=="yglb"||b=="spfl"){
					$(".main").append('<iframe class="viewiframe" src="${pageContext.request.contextPath}/'+b+'/qry'+b+'.do?page=1&pageSize=15" name="'+b+'"></iframe>');
				}else{
					$(".main").append('<iframe class="viewiframe" src="${pageContext.request.contextPath}/view/'+b+'.jsp" name="'+b+'"></iframe>');
				}
				showIFrame(b);
			}
		}
		showIFrame(b);
}
//检查标签是否存在
function checkTag(b){
	var Tags = $(".tagbtn");
	for(var i=0;i<Tags.length;i++){
		if($(Tags[i]).attr("name") == b)
		return false;
	}
	return true;
}
//点击关闭标签
function closeTag(obj){
	var b = $(obj).parent().attr("name");
	$("iframe[name="+b+"]").remove();
	$(obj).parent().parent().remove();
	var b = $(".viewiframe").last().attr("name");
	alert(b);
}
//点击按钮切换页面
function changeIFrame(btn){
	var b = $(btn).attr("name");
	showIFrame(b);
}
//隐藏其他页签，显示首页
function showMain(){
	$("iframe").hide();
	$("#main-iframe").show();
}
//隐藏其他页签，显示当前页签
function showIFrame(b){
	var iframes = $(".viewiframe");
	for(var i=0;i<iframes.length;i++){
		if($(iframes[i]).attr("name")==b)
			$(iframes[i]).show();
		else
			$(iframes[i]).hide();
	}
}
</script>
</head>
</head>

<body>

	<header class="am-topbar admin-header">
		 <div class="am-topbar-brand">
			<img src="../i/logo.png">
		</div>

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
			<ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

				<li class="am-dropdown tognzhi" data-am-dropdown>
					<button
						class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o"
						data-am-dropdown-toggle>
						消息管理<span class="am-badge am-badge-danger am-round">6</span>
					</button>
					<ul class="am-dropdown-content">
						<li class="am-dropdown-header">所有消息都在这里</li>
						<li><a href="#">未激活会员 <span
								class="am-badge am-badge-danger am-round">556</span></a></li>
						<li><a href="#">未激活代理 <span
								class="am-badge am-badge-danger am-round">69</span></a></a></li>
						<li><a href="#">未处理汇款</a></li>
						<li><a href="#">未发放提现</a></li>
						<li><a href="#">未发货订单</a></li>
						<li><a href="#">低库存产品</a></li>
						<li><a href="#">信息反馈</a></li>
					</ul>
				</li>
				<li class="kuanjie"><a href="#">会员管理</a> <a href="#">奖金管理</a> <a
					href="#">订单管理</a> <a href="#">产品管理</a> <a href="#">个人中心</a> <a
					href="#">系统设置</a></li>
				<li class="soso">
					<p>
						<select
							data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
							<option value="b">全部</option>
							<option value="o">产品</option>
							<option value="o">会员</option>
						</select>
					</p>
					<p class="ycfg">
						<input type="text" class="am-form-field am-input-sm"
							placeholder="圆角表单域" />
					</p>
					<p>
						<button class="am-btn am-btn-xs am-btn-default am-xiao">
							<i class="am-icon-search"></i>
						</button>
					</p>
				</li>
				<li class="am-hide-sm-only" style="float: right;"><a
					href="javascript:;" id="admin-fullscreen"><span
						class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
			</ul>
		</div>
		
	</header>

	<div class="am-cf admin-main">
		<div class="nav-navicon admin-main admin-sidebar">


			<div class="sideMenu am-icon-dashboard"
				style="color: #aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：程兆祥</div>
			<div class="sideMenu">
				<h5 class="am-icon-flag">
					<em></em> 商品管理
				</h5>
				<ul>
					<li><a name="splb" href="javascript:void(0)" onclick="openTag(this)">商品列表</a></li>
					<li class="func" dataType='html' dataLink='msn.htm'
						iconImg='images/msn.gif'><a name="tjxsp" href="javascript:void(0)" onclick="openTag(this)">添加新商品</a></li>
					<li><a name="spfl" href="javascript:void(0)" onclick="openTag(this)">商品分类</a></li>
					<li><a name="sphsz" href="javascript:void(0)" onclick="openTag(this)">商品回收站</a></li>
					<li><a name="kcgl" href="javascript:void(0)" onclick="openTag(this)">库存管理</a></li>
				</ul>
				<h5 class="am-icon-flag">
					<em></em> 人员管理
				</h5>
				<ul>
					<li><a name="yglb" href="javascript:void(0)" onclick="openTag(this)">员工列表</a></li>
					<li><a name="xzyg" href="javascript:void(0)" onclick="openTag(this)">新增员工</a></li>
					<li><a name="jgyg" href="javascript:void(0)" onclick="openTag(this)">解雇员工</a></li>
					<li><a name="yglb" href="javascript:void(0)" onclick="openTag(this)">个人信息</a></li>
				</ul>
				<h5 class="am-icon-cart-plus">
					<em></em>  订单管理
				</h5>
				<ul>
					<li><a name="ddlb" href="javascript:void(0)" onclick="openTag(this)">订单列表</a></li>
					<li><a name="hbdd" href="javascript:void(0)" onclick="openTag(this)">合并订单</a></li>
					<li><a name="dddy" href="javascript:void(0)" onclick="openTag(this)">订单打印</a></li>
					<li><a href="">添加订单</a></li>
					<li><a href="">发货单列表</a></li>
					<li><a href="">换货单列表</a></li>
				</ul>
			 	<h5 class="am-icon-users">
					<em></em> 会员管理
				</h5>
				<ul>
					<li><a href="">会员列表</a></li>
					<li><a href="">未激活会员</a></li>
					<li><a href="">团队系谱图</a></li>
					<li><a href="">会员推荐图</a></li>
					<li><a href="">推荐列表</a></li>
				</ul>
				<h5 class="am-icon-volume-up">
					<em></em> 信息通知
				</h5>
				<ul>
					<li><a href="">站内消息 /留言</a></li>
					<li><a href="">短信</a></li>
					<li><a href="">邮件</a></li>
					<li><a href="">微信</a></li>
					<li><a href="">客服</a></li>
				</ul>
				<h5 class="am-icon-gears">
					<em></em> 系统设置
				</h5>
				<ul>
					<li><a href="">数据备份</a></li>
					<li><a href="">邮件/短信管理</a></li>
					<li><a href="">上传/下载</a></li>
					<li><a href="">权限</a></li>
					<li><a href="">网站设置</a></li>
					<li><a href="">第三方支付</a></li>
					<li><a href="">提现 /转账 出入账汇率</a></li>
					<li><a href="">平台设置</a></li>
					<li><a href="">声音文件</a></li>
				</ul> 
			</div>
			sideMenu End
			<script type="text/javascript">
				jQuery(".sideMenu").slide({
					titCell : "h5", //鼠标触发对象
					targetCell : "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
					effect : "slideDown", //targetCell下拉效果
					delayTime : 400, //效果时间
					triggerTime : 50, //鼠标延迟触发时间（默认150）
					defaultPlay : true,//默认是否执行效果（默认true）
					returnDefault : false
				//鼠标从.sideMen移走后返回默认状态（默认false）
				});
			</script>


		</div>

		<div class=" admin-content">
		
			<div class="daohang">
				<ul>
					<li><button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs" onclick="showMain()">首页</button></li>
				</ul>
			</div>
			<div class="admin">
			
				<div class="main">
					<iframe class="viewiframe" id="main-iframe" src="main.html" name="main" >
					</iframe>
				</div>
			
			
			</div>
		</div>
	</div>

	<script src="../js/amazeui.min.js"></script>



</body>
</html>