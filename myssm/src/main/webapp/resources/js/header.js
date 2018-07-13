function search() {
    window.location.href='http://localhost:8080/course/showInfoByName?cname='+$('#searchText').attr('value')
}



$(document).on('click', '.ui-menu-item', function () {
    window.location.href='http://localhost:8080/course/showInfoByName?cname='+$(this).text();
});

$(document).ready(function () {
    $('.selector').hover(
        function () {
            $('.city_panel').css('display','block');
        },
        function () {
            $('.city_panel').css('display','none');
        }

    );

    $('.city_panel a').click(function () {
        window.location.href='http://localhost:8080/?city='+$(this).text();
    });

    $('#searchText').bind('input propertychange', function() {
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/course/findByName",
            data:"cname="+$(this).val(),
            dataType:"json",
            success:function (data) {

                $('#searchText').autocomplete({
                    source: data
                });
            }
        });
    });


});

$(document).ready(function(){
    $.validator.addMethod("checkName",function(value,element,params){
        var checkName = /^\w{2,10}$/g;
        return this.optional(element)||(checkName.test(value));
    },"只允许2-10位英文字母或数字");
    $.validator.addMethod("checkPwd",function(value,element,params){
        var checkPwd = /^\w{2,10}$/g;
        return this.optional(element)||(checkPwd.test(value));
    },"只允许2-10位英文字母或数字");
    $.validator.addMethod("checkEml",function(value,element,params){
        var checkEmail = /^[a-z0-9]+@([a-z0-9]+\.)+[a-z]{2,4}$/i;
        return this.optional(element)||(checkEmail.test(value));
    },"请输入正确的邮箱！");
});


function login() {
    var form1 = $('#loginForm');
    form1.validate({
        rules: {
            username: {
                required: true,
                // checkName: true
            },
            password: {
                required: true,
                // checkPwd: true
            }
        },
        messages: {
            username: {
                required: "名字必填"
            },
            password: {
                required: "密码必填"
            }
        }
    });
    if (form1.valid()) {
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/client/login",
            data:form1.serialize(),
            dataType:"json",
            success:function (data) {
                if(!data.res){
                    alert("用户名不存在或密码错误");
                }else {
                    window.location.href=data.requestUrl;
                }
            }
        })
    }
}
function register() {
    var form1=$('#registerForm');
    form1.validate({
        rules:{
            username:{
                required:true,
                checkName:true
            },
            password:{
                required:true,
                checkPwd:true
            },
            email:{
                required:true,
                checkEml:true
            }
        },
        messages:{
            username:{
                required:"用户名不能为空"
            },
            password:{
                required:"密码不能为空"
            },
            email:{
                required:"邮箱不能为空"
            }
        }
    });
    if (form1.valid()) {
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/client/register",
            data:form1.serialize(),
            dataType:"json",
            success:function (data) {
                if(!data.res){
                    alert("用户名已存在");
                }else {
                    alert('注册成功');
                    window.location.href=data.requestUrl;
                }
            }
        })
    }
}
