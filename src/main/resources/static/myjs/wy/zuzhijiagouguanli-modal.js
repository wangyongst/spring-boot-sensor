$(function () {
    $("#deptSave").click(function () {
        $.post("/admin/dept/sud?" + $('#deptForm').serialize(),
            function (result) {
                if (result.status) {
                    $('#modal-default').modal('hide');
                } else {
                    alert(result.message);
                }
            });

    });
})