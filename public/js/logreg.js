$(function(){
    $(document).ready(function(){
        var tabs=$("[data-toggle=tabs]");
        tabs.click(function(){
            var id=$(this).attr("data-id");
            $(this).addClass("active");
            $(this).siblings().removeClass("active");
            var div=$(`#${id}`);
            div.css({
                "display":"block"
            });
            div.siblings().css({
                "display":"none"
            });
        })
    });
    $(document).ready(function(){
        $(".inputStyle").focus(function(){
            $(this).css("border-bottom","1px solid #000");
        }),
        $(".inputStyle").blur(function(){
            $(this).css("border-bottom","1px solid #eee");
        })
    });
    // $(document).ready(function(){
    //     var 
    // })

});
