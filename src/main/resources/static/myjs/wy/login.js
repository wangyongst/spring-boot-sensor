$(function () {
    $('#btn_Login').click(function () {
        $.post("/shiro/login",
            {
                username: $("#userid").val(),
                password: $("#pwd").val()
            },
            function (result) {
                if (result.status == 1) {
                    window.location.href = "/";
                } else {
                    alert(result.message);
                }
            });
    });
})