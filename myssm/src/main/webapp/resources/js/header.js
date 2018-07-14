
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
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/client/setCity",
            data:"city="+$(this).text(),
            success:function (data) {
                window.location.reload();
            }
        });
    });

    $("#searchText").autocomplete({
        source:function(request,response){
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/course/findByName",
                dataType : "json",
                data:"cname="+$("#searchText").val(),
                success : function(data) {
                    // var data = eval(json);//json数组
                    console.log(data[0]);

                    response($.map(data,function(item){
                        return {
                            label:item.cname+'--'+ item.cid,//下拉框显示值
                            value:item.cid//选中后，填充到下拉框的值
                        }
                    }));
                }
            });
        },
        delay: 500,//延迟500ms便于输入
        select : function(event, ui) {
            window.location.href='http://localhost:8080/course/showInfo?cid='+ui.item.value;
        }
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
                    window.location.reload();
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
                    window.location.reload();
                }
            }
        })
    }
}
