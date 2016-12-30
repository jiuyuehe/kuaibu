




//顶部信息部分
//var user_head_top = $('<div class="user_plugins_head"><div class="user_plugins_head_main"></div></div>');
//顶部账号信息点击展开收起
var user_name_box = document.getElementById('user_name_box');
var user_plugins_arrow_box = document.getElementById('user_plugins_arrow_box');
user_name_box.onclick = function(e){
    if(user_plugins_arrow_box.style.display=='none'){
        user_plugins_arrow_box.style.opacity='1';
        user_plugins_arrow_box.style.transform='scale(1)';
        user_plugins_arrow_box.style.display='block';
    }else{
        user_plugins_arrow_box.style.opacity='0';
        user_plugins_arrow_box.style.transform='scale(.8)';
        user_plugins_arrow_box.style.display='none';
    }

    //阻止事件冒泡
    if ( e && e.stopPropagation ) {
        e.stopPropagation();
    }else {
        window.event.cancelBubble = true; //IE取消事件冒泡的方式
    }
}
document.onclick = function(){
    if(user_plugins_arrow_box.style.display=='block'){
        user_plugins_arrow_box.style.opacity='0';
        user_plugins_arrow_box.style.transform='scale(.8)';
        user_plugins_arrow_box.style.display='none';
    }
}

//tips消息弹出消失
if($.fn.jquery == '1.9.1' || $.fn.jquery == '1.11.1') {
        $('#user_plugins_qqservice').on({
        mouseenter: function () {
            $('.service_tip').toggle();
        },
        mouseleave: function () {
            $('.service_tip').toggle();
        }
        });
} else {
    $('#user_plugins_qqservice').live('hover', function(e){
        $('.service_tip').toggle();
        e.stopPropagation();
    });
}

//左侧栏目切换，将直接添加删除的方式改为slide方式 
//$(".menuClick").click(function(){
//	$(this).parent().toggleClass("active");
//});

var li = $(".nav").children("li");
li.children().click(function(){ 

	var navSub = $(this).siblings('.nav-sub');
    var navParent = $(this).parent();

    if(navSub.is(':visible')) {
        navSub.slideUp('fast', function() {
            navParent.removeClass('active');
        });
    }else {
        navSub.slideDown('fast', function() {
            navParent.addClass('active');
        });
    }


});

//左侧栏目条目切换动作
var lison = $(".nav-sub").children("li");
lison.click(function(){
	$(this).addClass("active");
	$(this).siblings().removeClass("active");
});




























