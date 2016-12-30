$().ready(function() {
    $("#newuser").validate({
        submitHandler: function(form) {
            alert("提交事件!");
            form.submit();
        },
        rules:{
                username:{
                    required:true,
                    rangelength:[5,15]
                },
                password:{
                    required:true,
                    rangelength:[3,16]
                },
                repassword:{
                    equalTo:"#password"
                },
                name:{
                    required:true,
                    rangelength:[2,6] 
                },
                phone:{
                    required:true,
                    number:true,
                    rangelength:[8,11]
                },
                qq:{
                    required:true,
                    number:true,
                    rangelength:[5,14]
                }            
            },
            messages:{
                username:{
                    required:"必填",
                    rangelength: $.validator.format("用户名最小长度:{0}, 最大长度:{1}")
                },
                password:{
                    required: "不能为空",
                    rangelength: $.validator.format("密码最小长度:{0}, 最大长度:{1}")
                },
                repassword:{
                    equalTo:"两次密码输入不一致"
                },
                name:{
                    required:'必填',
                    rangelength: $.validator.format("名字最小长度:{0}, 最大长度:{1}") 
                },
                phone:{
                    required:'必填',
                    number:'只能输入数字',
                    rangelength: $.validator.format("联系方式最小长度:{0}, 最大长度:{1}") 
                },
                qq:{
                    required:'必填',
                    number:'只能输入数字',
                    rangelength: $.validator.format("QQ最小长度:{0}, 最大长度:{1}") 
                }                                   
            }
    });
});