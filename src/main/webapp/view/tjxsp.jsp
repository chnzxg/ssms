<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <link rel="stylesheet" href="../css/page/tjxsp.css">
    <link rel="stylesheet" href="../css/fileinput/fileinput.css">
    <script src="../js/page/tjxsp.js"></script>
    <script src="../js/fileinput/fileinput.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap/bootstrapValidator.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap/zh_CN.js"></script>
    <script>
        $(function () {
            $('#claid').on('change', function () {
                var options = $('#claid option:selected');
                $("#finid").children().remove();
                getFineList(options.val());
            });

            //表单验证
            $('#form').bootstrapValidator({
                    message: 'This value is not valid',
                    live: 'enabled',
                    submitButtons: 'button[type="submit"]',
                    fields: {
                        cname: {
                            enabled: true,
                            message: '输入值不合法',
                            validators: {
                                notEmpty: {
                                    message: '名称不能为空'
                                },
                                remote : {
                                    url : '${pageContext.request.contextPath}/splb/checkcname.do',
                                    message : "该商品名已存在",
                                    delay : 500,
                                    type : 'post',
                                }
                            }
                        },
                        month: {
                            enabled: true,
                            message: '输入值不合法',
                            validators: {
                                notEmpty: {
                                    message: '保质期不能为空'
                                },
                                stringLength: {
                                    min: 1,
                                    max: 3,
                                    message: '必须为1-3位'
                                },
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: '必须为纯数字'
                                }
                            }
                        },
                        cweight: {
                            enabled: true,
                            message: '输入值不合法',
                            validators: {
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: '必须为纯数字'
                                }
                            }
                        },
                        cprice: {
                            validators: {
                                notEmpty: {
                                    message: '价格不能为空'
                                },
                                regexp: {
                                    regexp: /^[0-9]+([.]{1}[0-9]+){0,1}$/,
                                    message: '必须为纯数字'
                                }
                            }
                        },
                        cdesc: {
                            validators: {
                                stringLength: {
                                    min: 0,
                                    max: 20,
                                    message: '必须小于20位'
                                },
                            }
                        },
                        cstock: {
                            validators: {
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: '必须为纯数字'
                                }
                            }
                        }
                    }
                }
            );
        });

        function addComm() {
            $('#form').bootstrapValidator('validate');
            if ($('#form').data("bootstrapValidator").isValid()) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/splb/addsplb.do',
                    data: $('#fomr').serialize(),
                    success: function (data) {
                        if (data == '1') {
                            $('#info').text('添加商品成功');
                            setTimeout(function () {
                                location.reload();
                            },1000);
                        }
                        else
                            $('#info').text('添加商品失败，请稍后重试');
                        $('#addinfo').modal('show')
                    }
                })
            }

            //$("#form").submit();
        }

        function getFineList(claid) {
            $.ajax({
                url: '${pageContext.request.contextPath}/spfl/qryfine.do?claid=' + claid,
                success: function (json) {
                    for (var i = 0; i < json.length; i++) {
                        $("#finid").append('<option value="' + json[i].finid + '">' + json[i].fname + '</option>');
                    }
                    $('#finid').removeAttr('disabled');
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
            <form id="form" enctype="multipart/form-data"  class="form-horizontal"
                  role="form" autocomplete="on">
                <div class="form-group">
                    <span for="cname" class="col-sm-2 control-label">商品名称：</span>
                    <div class="col-sm-3">
                        <input autofocus type="text" class="form-control" id="cname" name="cname"
                               placeholder="请输入40字以内的商品名称">
                    </div>
                </div>
                <div class="form-group">
                    <span for="claid" class="col-sm-2 control-label">大类：</span>
                    <div class="col-sm-3">
                        <select class="form-control" name="claid" id="claid">
                            <option></option>
                            <c:forEach items="${listclazz}" var="clazz">
                                <option value="${clazz.claid}">${clazz.cname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <span for="finid" class="col-sm-2 control-label">细类：</span>
                    <div class="col-sm-3">
                        <select disabled="disabled" class="form-control" name="finid" id="finid">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <span for="cweight" class="col-sm-2 control-label">重量：</span>
                    <div class="col-sm-3">
                        <div class="input-group"><input type="text" class="form-control" id="cweight" name="cweight"
                                                        placeholder="请输入商品重量"><span class="input-group-addon">克</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <span for="cprice" class="col-sm-2 control-label">价格：</span>
                    <div class="col-sm-3">
                        <div class="input-group"><input type="text" class="form-control" id="cprice" name="cprice"
                                                        placeholder="请输入商品价格"><span class="input-group-addon">元</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <span for="cproder" class="col-sm-2 control-label">生产商：</span>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="cproder" name="cproder" placeholder="请输入生产商">
                    </div>
                </div>
                <div class="form-group">
                    <span for="cprodatex" class="col-sm-2 control-label">生产日期：</span>
                    <div class="col-sm-3">
                        <input type="date" class="form-control" id="cprodatex" name="cprodatex">
                    </div>
                </div>
                <div class="form-group">
                    <span for="month" class="col-sm-2 control-label">保质期：</span>
                    <div class="col-sm-3">
                        <div class="input-group"><input type="text" class="form-control" id="month" name="month"
                                                        placeholder="请输入保质期"><span class="input-group-addon">月</span>
                        </div>
                    </div>
                </div>
                <%--<div class="form-group">
                    <span for="ccode" class="col-sm-2 control-label">代码：</span>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="ccode" name="ccode" placeholder="请输入商品代码，只能为数字">
                    </div>
                </div>--%>
                <div class="form-group">
                    <span for="cstock" class="col-sm-2 control-label">库存：</span>
                    <div class="col-sm-3">
                        <div class="input-group"><input type="text" class="form-control" id="cstock" name="cstock"
                                                        placeholder="请输入库存数量"><span class="input-group-addon">个</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <span for="cdesc" class="col-sm-2 control-label">描述：</span>
                    <div class="col-sm-3">
                        <textarea class="form-control" id="cdesc" name="cdesc" placeholder="请输入不超过20字的描述"></textarea>
                    </div>
                </div>
                <button type="button" class="button button-rounded button-small" data-dismiss="modal"
                        onclick="javascript:location.reload()">刷新
                </button>
                <button type="button" onclick="addComm()"
                        class="button button-rounded button-small button-primary button-glow">提交
                </button>
            </form>
        </div>
        <br>
    </div>
</div>

</body>
</html>