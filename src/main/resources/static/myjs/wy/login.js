$(function () {
    $('#btn_Login').click(function () {
        $.post("/shiro/login",
            {
                username: $("#userid").val(),
                password: $("#pwd").val()
            },
            function (result) {
            debugger;
                if (result.status == 1) {
                    window.location.href = "/";
                } else {
                    alert(result.message);
                }
            });
    });
})