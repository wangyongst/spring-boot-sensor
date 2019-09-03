$(function () {
    $("#roleSave").click(function () {
        $.post("/admin/role/sud?" + $('#roleForm').serialize(),
            function (result) {
                if (result.status) {
                    $('#modal-default').modal('hide');
                } else {
                    alert(result.message);
                }
            });
    });
})