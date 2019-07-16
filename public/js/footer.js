$(function(){
    // // 轮播图
    $(document).ready(function(){
    //slideIndex 记录初始图片的下标（设置了left-1200，所以下标以-1200为开始，slideIndex初始值为0）
    var isclickable=true;
    var slideIndex=1;
    //获取左右按钮元素
    var left=$(".wallBox .icon-angle-left");
    var right=$(".wallBox .icon-angle-right");
    var list=$(".scrollerList");
    //左边按钮点击事件
    left.on("click",function(){
        //点击左按钮的时候想显示前面一张图片，所以 slideIndex要减1
        if(isclickable){
            slideIndex--;
        }else{
            return false;
        }
        isclickable=false;
        //animatedLength表示想要让scrollerList移动到什么位置，scrollerList的位置 由left 属性来控制。
        var animatedLength=slideIndex*(-400)+"px";
        list.animate({"left":animatedLength},"slow",function(){
            isclickable=true;
            if(slideIndex<=0){
                $(".scrollerList").css({"left":"-2000px"});
                slideIndex=5;
            }
        });
    });
    //右边按钮点击事件
    right.on("click",function(){
        //点击右按钮时想要显示当前图片的后一张，所以slideIndex值加1
        if(isclickable){
            slideIndex++;
        }else{
            return false;
        }
        isclickable=false;
        var animatedLength=slideIndex*(-400)+"px";
        list.animate({"left":animatedLength},"slow",function(){
            isclickable=true;
            if(slideIndex>=6){
                list.css({"left":"-400px"});
                slideIndex=1;
            }
        });
    });
    // 定时器自动轮播
    setInterval(function(){
        right.click();
    },3000);

});
})