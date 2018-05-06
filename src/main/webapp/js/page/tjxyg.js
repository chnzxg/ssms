$(function () {
    $("#form-test").bootstrapValidator({
        live: 'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
        excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
        submitButtons: '#btn-test',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
        message: '通用的验证失败消息',//好像从来没出现过
        feedbackIcons: {//根据验证结果显示的各种图标
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            text: {
                validators: {
                    notEmpty: {//检测非空,radio也可用
                        message: '文本框必须输入'
                    },
                    stringLength: {//检测长度
                        min: 6,
                        max: 30,
                        message: '长度必须在6-30之间'
                    },
                    regexp: {//正则验证
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: '所输入的字符不符要求'
                    },
                    remote: {//将内容发送至指定页面验证，返回验证结果，比如查询用户名是否存在
                        url: '指定页面',
                        message: 'The username is not available'
                    },
                    different: {//与指定文本框比较内容相同
                        field: '指定文本框name',
                        message: '不能与指定文本框内容相同'
                    },
                    emailAddress: {//验证email地址
                        message: '不是正确的email地址'
                    },
                    identical: {//与指定控件内容比较是否相同，比如两次密码不一致
                        field: 'confirmPassword',//指定控件name
                        message: '输入的内容不一致'
                    },
                    date: {//验证指定的日期格式
                        format: 'YYYY/MM/DD',
                        message: '日期格式不正确'
                    },
                    choice: {//check控件选择的数量
                        min: 2,
                        max: 4,
                        message: '必须选择2-4个选项'
                    }
                }
            }
        }
    });
    $("#btn-test").click(function () {//非submit按钮点击后进行验证，如果是submit则无需此句直接验证
        $("#form-test").bootstrapValidator('validate');//提交验证
        if ($("#form-test").data('bootstrapValidator').isValid()) {//获取验证结果，如果成功，执行下面代码
            alert("yes");//验证成功后的操作，如ajax
        }
    });
});