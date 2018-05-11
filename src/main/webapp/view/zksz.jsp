<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <link rel="stylesheet" href="../css/page/tjxsp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrapValidator.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrapValidator.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap/zh_CN.js"></script>
    <script>
        function add() {
            var obj = new Array();
            for(var i = 1 ; i <= 10 ; i ++){
                var map = {};
                map['mlevel'] = $('#mlevel'+i).val();
                map['percent'] = $('#percent'+i).val();
                map['money'] = $('#money'+i).val();
                obj.push(map);
            }
            var str = JSON.stringify(obj);
            $.get({
                url: '${pageContext.request.contextPath}/discount/upddiscount.do?str='+str,
                success: function (data) {
                    if (data == '1') {
                        $('#info').text('修改成功');
                        setTimeout(function () {
                            location.reload();
                        }, 1000);
                    }
                    else
                        $('#info').text('修改失败，请稍后重试');
                    $('#addinfo').modal('show');
                }
            })
        }
    </script>
</head>
<body><br>
<!-- 提示窗口 -->
<div class="modal fade" id="addinfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">信息</h4>
            </div>
            <div class="modal-body"><h4 id="info"></h4></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<div id="main" style="width:98%;height:100%;">
    <br>
    <div class="card2" style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
        <br>
        <div id="formdiv" style="width:100%;height:100%;">
            <c:forEach items="${discounts}" var="discount" varStatus="i">
                <div class="form-inline">
                    <div class="form-group ">
                        <input type="hidden" value="${discount.mlevel}" id="mlevel${i.count}">
                        <label>会员等级${discount.mlevel}：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label>折扣率</label>
                        <input name="percent" id="percent${i.count}" value="${discount.percent}" type="text"
                               class="form-control" placeholder="请输入商品名称"/>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="form-group">
                        <label>消费额</label>
                        <input name="money" id="money${i.count}" value="${discount.money}" type="text"
                               class="form-control" placeholder="请输入密码"/>
                    </div>&nbsp;&nbsp;
                </div>
                <br>
            </c:forEach>
            <button type="button" class="button button-rounded button-small" data-dismiss="modal"
                    onclick="javascript:location.reload()">刷新
            </button>
            <button onclick="add()"
                    class="button button-rounded button-small button-primary button-glow">提交
            </button>
            </form>
        </div>
        <br>
    </div>
</div>

</body>
</html>