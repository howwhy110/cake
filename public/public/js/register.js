$(function(){
    // 注册页面手机号失焦判断
    $("#phone").blur(function(){
        var phone=$(this).val();
        var testphone=/^[1][3,4,5,7,8][0-9]{9}$/;
        var pck=$("#pck");
        if(testphone.test(phone)){
            $.ajax({
                    url:"http://127.0.0.1:8080/user/phone",
                    type:"get",
                    data:{phone},
                    success:function(result){
                        console.log(result);
                        if(result==0){
                            pck.text("手机号可用").css("color","#3e3");
                        }else{
                            pck.text("手机号已被使用").css("color","#f00");
                        }
                    }
        
                })
            }else if(phone!=""){
                pck.text("输入的手机号不符合规范").css("color","#f00");
            }else{
                pck.text("手机号不能为空").css("color","#f00");
            }

    });
    // 注册页面密码判断
    $("#upwd").blur(function(){
        var upwd=$(this).val();
        var testupwd=/^\w{6,30}$/;
        var upck=$("#upck");
        if(upwd==""){
            upck.text("");
        }else if(testupwd.test(upwd)){
            upck.text("密码符合规范").css("color","#3e3");
        }else{
            upck.text("密码不合规范，请重新输入！").css("color","#f00");
        }
    });
    $("#reupwd").blur(function(){
        var reupwd=$(this).val();
        var upwd=$("#upwd").val();
        var upreck=$("#upreck");
        if(reupwd==""){
            upreck.text("");
        }else if(reupwd==upwd){
            upreck.text("两次输入的密码一致").css("color","#3e3");
        }else{
            upreck.text("两次输入的密码不一致").css("color","#f00");
        }
    });
    // 是否同意购物协议，同意可以点击注册 ，不用一不能点击
    $(".accept").click(function(){
    if(!$(".accept").prop("checked")){
            $(".submit").attr("disabled","disabled");
        
        }else{
            $(".submit").removeAttr("disabled");
        }
    });
    $(".submit").click(function(){
        console.log("dianjile");
    });
});