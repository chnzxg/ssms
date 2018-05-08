<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <%@include file="../include/general.jsp" %>
    <script>
        $(function () {
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
            //分页插件初始化
            $('#pagination1').jqPaginator({
                totalPages: ${pageCount},
                visiblePages: 7,
                currentPage: ${page},
                first: '<li class="first"><a class="up" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=1&pageSize=15">首页</a></li>',
                prev: '<li class="prev"><a class="up" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${page-1}&pageSize=15">上一页</a></li>',
                next: '<li class="next"><a class="down" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${page+1}&pageSize=15">下一页</a></li>',
                last: '<li class="last"><a class="down" href="${pageContext.request.contextPath}/yglb/qryyglb.do?page=${pageCount}&pageSize=15">末页</a></li>',
                page: '<li class="page"><a href="${pageContext.request.contextPath}/yglb/qryyglb.do?page={{page}}&pageSize=15">{{page}}</a></li>',
                onPageChange: function (num) {
                    $('#text').html('当前第' + num + '页');
                }
            });
            if (${page==1})
                $(".up").attr("href", "javascript:void(0)");
            if (${pageCount==page})
                $(".down").attr("href", "javascript:void(0)");
        });
        function qryDetail(empid) {
            $.ajax({
                url: "${pageContext.request.contextPath}/yglb/qryDetail.do?empid=" + empid,
                success: function (data) {
                    $("#myModalLabel").text(data.ename);
                    $("#ename").val(data.ename);
                    if (data.esex == "1"){
                        $('#esex1').attr('checked','checked');
                    }
                    else{
                        $('#esex2').attr('checked','checked');
                    }
                    $("#epro").find("option[value = '"+data.epro+"']").attr("selected","selected");
                    $("#eage").val(data.eage);
                    $("#etel").val(data.etel);
                    $("#email").val(data.email);
                    $("#esal").val(data.esal);
                }
            });
        }
    </script>
    <style type="text/css">
        .col-sm-4{
            margin-bottom: 10px;
        }
        .col-sm-6{
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div id="main" style="background-color:#eee;">
    <br>
    <div style="width:95%;background-color:#fff;margin:0 auto;text-align:center">
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
                                  action="${pageContext.request.contextPath}/yglb/updyglb.do?page=1&pageSize=15">
                                <input type="hidden" id="empid" name="empid">
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="ename" class="col-sm-4 control-label">姓名：</span>
                                    <div class="col-sm-6">
                                        <input autofocus type="text" class="form-control" id="ename" name="ename"
                                               placeholder="请输入10个字以内的姓名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="claid" class="col-sm-4 control-label">性别：</span>
                                    <div class="col-sm-6" style="height: 34px;line-height: 34px;">
                                        <label class="radio-inline">
                                            <input style="height: 30px;line-height: 30px;" type="radio" name="optionsRadiosinline" id="esex1" value="1"> 男
                                        </label>
                                        <label class="radio-inline">
                                            <input style="height: 30px;line-height: 30px;" type="radio" name="optionsRadiosinline" id="esex2"  value="2"> 女
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="eage" class="col-sm-4 control-label">年龄：</span>
                                    <div class="col-sm-6">
                                        <div class="input-group"><input type="text" class="form-control" id="eage" name="eage"
                                                                        placeholder="请输入年龄，只能为数字"><span class="input-group-addon">岁</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="esal" class="col-sm-4 control-label">薪水：</span>
                                    <div class="col-sm-6">
                                        <div class="input-group"><input type="text" class="form-control" id="esal" name="esal"
                                                                        placeholder="请输入薪水，只能为数字"><span class="input-group-addon">元</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="etel" class="col-sm-4 control-label">电话：</span>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="etel" name="etel" placeholder="请输入11位的电话号码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="claid" class="col-sm-4 control-label">工种：</span>
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
                                    <span style="height: 34px;line-height: 34px;text-align: right" for="email" class="col-sm-4 control-label">邮箱：</span>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="email" name="email" placeholder="请输入正确格式的邮箱">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="button button-rounded button-small" data-dismiss="modal">关闭
                            </button>
                            <button type="button" onclick="updateComm()"
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
                            <td style="width:6%;"><a href="javascript:void(0);" onclick="qryDetail(${emp.empid})"
                                                     data-toggle="modal" data-target="#myModal">${emp.ename}</a></td>
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
                            <td style=""><a style="width:25px;height:20px;"
                                            href="${pageContext.request.contextPath}/yglb/delyglb.do?empid=${emp.empid}&page=${page}&pageSize=15">x</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="pagediv" style="width:95%;height:15%;">
            <ul class="pagination" id="pagination1"></ul>
        </div>
    </div>
</div>


</body>
</html>
