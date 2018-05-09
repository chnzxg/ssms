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
        function addEmployee() {
            $('#formdiv').bootstrapValidator('validate');
            if ($('#formdiv').data("bootstrapValidator").isValid()) {
                $.post({
                    url: '${pageContext.request.contextPath}/yglb/addayglb.do',
                    data: $('#form').serialize(),
                    success: function (data) {
                        if (data == '1') {
                            $('#info').text('添加员工成功');
                            setTimeout(function () {
                                location.reload();
                            },1000);
                        }else
                            $('#info').text('添加员工失败，请稍后重试');
                        $('#addinfo').modal('show');
                    }
                })
            }
        }

        $(function () {
            $('#claid').on('change',function () {
                var options = $('#claid option:selected');
                $("#finid").children().remove();
                getFineList(options.val());
            });

            //表单验证
            $('#formdiv').bootstrapValidator({
                message: 'This value is not valid',
                live: 'enabled',
                submitButtons: 'button[type="submit"]',
                fields: {
                    ename: {
                        enabled: true,
                        message: '输入值不合法',
                        validators: {
                            stringLength: {
                                min: 1,
                                max: 6,
                                message: '长度必须在1-6之间'
                            },
                            notEmpty: {
                                message: '姓名不能为空'
                            }
                        }
                    },
                    eno: {
                        enabled: true,
                        message: '输入值不合法',
                        validators: {
                            notEmpty: {
                                message: '工号不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 6,
                                message: '必须为6位'
                            },
                            regexp: {
                                regexp: /^[0-9]+$/,
                                message: '必须为纯数字'
                            }
                        }
                    },
                    eage: {
                        enabled: true,
                        message: '输入值不合法',
                        validators: {
                            stringLength: {
                                min: 2,
                                max: 2,
                                message: '长度不合法'
                            },
                            regexp: {
                                regexp: /^[0-9]+$/,
                                message: '必须为纯数字'
                            }
                        }
                    },
                    etel: {
                        enabled: true,
                        message: '输入值不合法',
                        validators: {
                            stringLength: {
                                min: 11,
                                max: 11,
                                message: '必须为11位'
                            },
                            regexp: {
                                regexp: /^[0-9]+$/,
                                message: '必须为纯数字'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: '邮箱不能为空'
                            },
                            emailAddress: {
                                message: '邮箱地址格式有误'
                            }
                        }
                    },
                    esal: {
                        validators: {
                            notEmpty: {
                                message: '薪水不能为空'
                            },
                            regexp: {
                                regexp: /^([0-9]+[.][0-9]+)$/,
                                message: '必须为纯数字'
                            }
                        }
                    }
                }
            });

        });
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
    <div style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
        <br>
        <div id="formdiv" style="width:100%;height:100%;">
            <form id="form" action="" class="form-horizontal"
                  role="form" autocomplete="on">
                <div class="form-group">
                    <span for="ename" class="col-sm-2 control-label">姓名：</span>
                    <div class="col-sm-3">
                        <input autofocus type="text" class="form-control" id="ename" name="ename"
                               placeholder="请输入10个字以内的姓名">
                    </div>
                </div>
                <div class="form-group">
                    <span for="claid" class="col-sm-2 control-label">性别：</span>
                    <div class="col-sm-3">
                        <label class="radio-inline">
                            <input style="height: 15px;line-height: 30px;" type="radio" name="optionsRadiosinline" id="optionsRadios3" value="1" checked> 男
                        </label>
                        <label class="radio-inline">
                            <input style="height: 15px;line-height: 30px;" type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="2"> 女
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <span for="eno" class="col-sm-2 control-label">工号：</span>
                    <div class="col-sm-3">
                        <input autofocus type="text" class="form-control" id="eno" name="eno"
                               placeholder="请输入6位工号，只能为数字">
                    </div>
                </div>
                <div class="form-group">
                    <span for="eage" class="col-sm-2 control-label">年龄：</span>
                    <div class="col-sm-3">
                        <div class="input-group"><input type="text" class="form-control" id="eage" name="eage"
                                                        placeholder="请输入年龄，只能为数字"><span class="input-group-addon">岁</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <span for="esal" class="col-sm-2 control-label">薪水：</span>
                    <div class="col-sm-3">
                        <div class="input-group"><input type="text" class="form-control" id="esal" name="esal"
                                                        placeholder="请输入薪水，只能为数字"><span class="input-group-addon">元</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <span for="etel" class="col-sm-2 control-label">电话：</span>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="etel" name="etel" placeholder="请输入11位的电话号码">
                    </div>
                </div>
                <div class="form-group">
                    <span for="etime" class="col-sm-2 control-label">入职时间：</span>
                    <div class="col-sm-3">
                        <input type="date" class="form-control" id="etime" name="etime">
                    </div>
                </div>
                <div class="form-group">
                    <span for="claid" class="col-sm-2 control-label">工种：</span>
                    <div class="col-sm-3">
                        <select class="form-control" name="epro" id="epro">
                            <option value="2">经理</option>
                            <option value="3">促销员</option>
                            <option value="4">收银员</option>
                            <option value="5">收货员</option>
                            <option value="6">理货员</option>
                            <option value="7">保洁</option>
                        </select>
                    </div>
                </div>
                <%--<div class="form-group">
                    <span for="ccode" class="col-sm-2 control-label">代码：</span>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="ccode" name="ccode" placeholder="请输入商品代码，只能为数字">
                    </div>
                </div>--%>
                <div class="form-group">
                    <span for="email" class="col-sm-2 control-label">邮箱：</span>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="email" name="email" placeholder="请输入正确格式的邮箱">
                    </div>
                </div>
                <button type="button" class="button button-rounded button-small" data-dismiss="modal"
                        onclick="javascript:location.reload()">刷新
                </button>
                <button onclick="addEmployee()"
                        class="button button-rounded button-small button-primary button-glow">提交
                </button>
            </form>
        </div>
        <br>
    </div>
</div>

</body>
</html>