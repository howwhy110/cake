$(function(){
    $(document).ready(function(){

        var act=$(".navBox li");
        act.click(function(){
            $(this).addClass("active")
            .siblings().removeClass("active");
        });
    });




});