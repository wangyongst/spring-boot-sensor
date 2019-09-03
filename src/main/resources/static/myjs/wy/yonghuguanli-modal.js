$(function () {
    $("#useSave").click(function () {
        $.post("/admin/user/sud?" + $('#userForm').serialize(),
            function (result) {
                if (result.status) {
                    $('#modal-default').modal('hide');
                } else {
                    alert(result.message);
                }
            });
    });
})