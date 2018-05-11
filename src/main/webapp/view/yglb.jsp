<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <link rel="stylesheet" href="../css/page/splb.css">
    <script>
        function update() {
            $('#form').submit();
        }

        function del1(id) {
            $('#delvalue').val(id);
        }

        function del2() {
            var id = $('#delvalue').val();
            location.href = '${pageContext.request.contextPath}/yglb/delyglb.do?empid=' + id + '&page=${page}&pageSize=15';
        }

        $(function () {
            //分页插件初始化
            $('#pagination1').jqPaginator({
                totalPages: ${pageCount},
                visiblePages: 7,
                currentPage: ${page},
                first: '<li class="first"><a style="font-size: 16px" class="up" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=1&pageSize=15">&laquo;</a></li>',
                prev: '<li class="prev"><a style="font-size: 16px" class="up" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${page-1}&pageSize=15">&lsaquo;</a></li>',
                next: '<li class="next"><a style="font-size: 16px" class="down" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${page+1}&pageSize=15">&rsaquo;</a></li>',
                last: '<li class="last"><a style="font-size: 16px" class="down" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${pageCount}&pageSize=15">&raquo;</a></li>',
                page: '<li class="page"><a style="font-size: 16px" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page={{page}}&pageSize=15">{{page}}</a></li>',
                onPageChange: function (num) {
                    $('#text').html('当前第' + num + '页');
                }
            });
            if (${page==1})
                $(".up").attr("href", "javascript:void(0)");
            if (${pageCount==page})
                $(".down").attr("href", "javascript:void(0)");
        });

        /*$(function () {
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
        });*/
        function qryDetail(empid) {
            $("#empid").val(empid);
            $.ajax({
                url: "${pageContext.request.contextPath}/yglb/qryDetail.do?empid=" + empid,
                success: function (data) {
                    $("#myModalLabel").text(data.ename);
                    $("#ename").val(data.ename);
                    if (data.esex == "1") {
                        $('#esex1').attr('checked', 'checked');
                    }
                    else {
                        $('#esex2').attr('checked', 'checked');
                    }
                    $("#epro").find("option[value = '" + data.epro + "']").attr("selected", "selected");
                    $("#eage").val(data.eage);
                    $("#etel").val(data.etel);
                    $("#email").val(data.email);
                    $("#esal").val(data.esal);
                }
            });
        }
    </script>
    <style type="text/css">
        .col-sm-4 {
            margin-bottom: 10px;
        }

        .col-sm-6 {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div id="main" style="background-color:#eee;">
    <div class="search-div card2">
        <div style="float: right;">
            <form class="form-inline" role="form" autocomplete="off"
                  method="get"
                  action="${pageContext.request.contextPath}/yglb/seryglb.do"
            >
                <input type="hidden" name="page" value="${page}">
                <div class="form-group ">
                    <label for="f1">姓名</label>
                    <input name="ename" value="${employee.ename}" type="text" id="f1" class="form-control"
                           placeholder="请输入姓名"/>
                </div>&nbsp;&nbsp;
                <div class="form-group">
                    <label for="f4">年龄</label>
                    <input name="eage" value="${employee.eage}" type="text" id="f4" class="form-control"
                           placeholder="请输入年龄"/>
                </div>&nbsp;&nbsp;
                <div class="form-group">
                    <label for="f2">性别</label>
                    <select id="f2" class="form-control">
                        <option>全部</option>
                        <option name="esex"
                                <c:if test="${employee.esex==1}">selected="selected"</c:if> value="1">男
                        </option>
                        <option name="esex"
                                <c:if test="${employee.esex==2}">selected="selected"</c:if> value="2">女
                        </option>
                    </select>
                </div>&nbsp;&nbsp;
                <div class="form-group">
                    <label for="f3">工种</label>
                    <select id="f3" class="form-control">
                        <option>全部</option>
                        <option name="epro"
                                <c:if test="${employee.epro==1}">selected="selected"</c:if> value="1">店长
                        </option>
                        <option name="epro"
                                <c:if test="${employee.epro==2}">selected="selected"</c:if> value="2">经理
                        </option>
                        <option name="epro"
                                <c:if test="${employee.epro==3}">selected="selected"</c:if> value="3">促销员
                        </option>
                        <option name="epro"
                                <c:if test="${employee.epro==4}">selected="selected"</c:if> value="4">收银员
                        </option>
                        <option name="epro"
                                <c:if test="${employee.epro==5}">selected="selected"</c:if> value="5">收获员
                        </option>
                        <option name="epro"
                                <c:if test="${employee.epro==6}">selected="selected"</c:if> value="6">理货员
                        </option>
                        <option name="epro"
                                <c:if test="${employee.epro==7}">selected="selected"</c:if> value="7">保洁
                        </option>
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
                        此操作会删除员工且无法恢复，是否继续？
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
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel"></h4>
                        </div>
                        <div class="modal-body" style="height:420px;width:600px;">
                            <!-- 表单 -->
                            <form id="form" method="post" class="bs-example bs-example-form"
                                  action="${pageContext.request.contextPath}/yglb/updyglb.do">
                                <input type="hidden" id="empid" name="empid">
                                <input type="hidden" value="${page}" name="page">
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="ename"
                                          class="col-sm-4 control-label">姓名：</span>
                                    <div class="col-sm-6">
                                        <input autofocus type="text" class="form-control" id="ename" name="ename"
                                               placeholder="请输入10个字以内的姓名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="claid"
                                          class="col-sm-4 control-label">性别：</span>
                                    <div class="col-sm-6" style="height: 34px;line-height: 34px;">
                                        <label class="radio-inline">
                                            <input style="height: 30px;line-height: 30px;" type="radio"
                                                   name="esex" id="esex1" value="1"> 男
                                        </label>
                                        <label class="radio-inline">
                                            <input style="height: 30px;line-height: 30px;" type="radio"
                                                   name="esex" id="esex2" value="2"> 女
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="eage"
                                          class="col-sm-4 control-label">年龄：</span>
                                    <div class="col-sm-6">
                                        <div class="input-group"><input type="text" class="form-control" id="eage"
                                                                        name="eage"
                                                                        placeholder="请输入年龄，只能为数字"><span
                                                class="input-group-addon">岁</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="esal"
                                          class="col-sm-4 control-label">薪水：</span>
                                    <div class="col-sm-6">
                                        <div class="input-group"><input type="text" class="form-control" id="esal"
                                                                        name="esal"
                                                                        placeholder="请输入薪水，只能为数字"><span
                                                class="input-group-addon">元</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="etel"
                                          class="col-sm-4 control-label">电话：</span>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="etel" name="etel"
                                               placeholder="请输入11位的电话号码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="claid"
                                          class="col-sm-4 control-label">工种：</span>
                                    <div class="col-sm-6">
                                        <select class="form-control" name="epro" id="epro">
                                            <option value="1" disabled="disabled">店长</option>
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
                                    <span for="ccode" class="col-sm-4 control-label">代码：</span>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="ccode" name="ccode" placeholder="请输入商品代码，只能为数字">
                                    </div>
                                </div>--%>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="email"
                                          class="col-sm-4 control-label">邮箱：</span>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="email" name="email"
                                               placeholder="请输入正确格式的邮箱">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="button button-rounded button-small" data-dismiss="modal">关闭
                            </button>
                            <button type="button" onclick="update()"
                                    class="button button-rounded button-small button-primary button-glow">提交
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div id="divtable" class="divtable" style="background-color:#fff;">
                <table class="table table-hover table-condensed table-striped" id="commtable">
                    <thead>
                    <tr>
                        <th style="display:none">empid</th>
                        <th style="text-align:center;vertical-align:middle;">序号</th>
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
                    <c:forEach items="${list}" var="emp" varStatus="status">
                        <tr style="height:20px;">
                            <td id="comid" style="display:none">${emp.empid}</td>
                            <td style="width:4%;">${status.count}</td>
                            <td style="width:6%;"><a
                                    <c:if test="${emp.empid!=10000}">
                                        href="javascript:void(0);" onclick="qryDetail(${emp.empid})"
                                        data-toggle="modal" data-target="#myModal"</c:if>
                                    <c:if test="${emp.empid==1}"> href="javascript:return false;"</c:if>
                            >${emp.ename}</a></td>
                            <td style="width:6%;"><c:if test="${emp.esex==1}">男</c:if>
                                <c:if test="${emp.esex==2}">女</c:if></td>
                            <td style="width:6%;">${emp.eage}岁</td>
                            <td style="width:15%;"><fmt:formatDate pattern="yyyy-MM-dd" value="${emp.etime}"/></td>
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
                            <td style="width:10%;"><a
                                    <c:if test="${emp.empid!=10000}">
                                        onclick="del1(${emp.empid})"
                                        data-toggle="modal"
                                        data-target="#myModal1"
                                        href="javascript:void(0)"</c:if>
                                    <c:if test="${emp.empid==1}"> href="javascript:return false;"</c:if>
                            ><b style="font-size: 16px; color: red;">&times;</b></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="pagediv" style="width:95%;height:15%;">
            <ul class="pagination" id="pagination1">
            </ul>
            <div style="float: right; margin-top: 20px">
                <a class="button button-rounded button-small" data-dismiss="modal"
                   onclick="report(this,'commtable','员工列表')">导出
                </a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
