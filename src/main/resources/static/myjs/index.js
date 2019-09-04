$('.main-sidebar').height(window.innerHeight - 40);
$("#menuFrame").height(window.innerHeight - 100);
$("#dituFrame").width($("#ditu").width());
$("#dituFrame").height(window.innerHeight - 100);
$('.sidebar-toggle').click(function () {
    $('.main-sidebar').toggleClass('scroll');
})
$(window).resize(function () {
    $("#menuFrame").height(window.innerHeight - 100);
    $("#dituFrame").width($("#ditu").width());
    $("#dituFrame").height(window.innerHeight - 100);
    $('.main-sidebar').height(window.innerHeight - 40);
});
var swiperone = new Swiper('.swiper1', {
    slidesPerView: 12,
    spaceBetween: 0,
    freeMode: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
});

$('.swiper1 a').click(function () {
    $(this).parent().addClass('active').siblings().removeClass('active');
})
//左侧导航的点击事件
$('.sidebar-menu li:not(.treeview)>a').on('click', function () {
    $(this).parent().addClass('active').siblings().removeClass('active');//同一级
    $(this).parents().siblings().removeClass('active');
    $(this).parents().siblings().find('li').removeClass('active');
});

// $('#logout').on('click', function () {
//     $.post("/shiro/logout")
// });

function logout() {
    $.post("/shiro/logout");
    window.location.href = "/login";
}


  
