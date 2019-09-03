$(function () {
    $("#permissionSave").click(function () {
        $.post("/admin/permission/sud?" + $('#permissionForm').serialize(),
            function (result) {
                if (result.status) {
                    $('#modal-default').modal('hide');
                } else {
                    alert(result.message);
                }
            });
    });
})