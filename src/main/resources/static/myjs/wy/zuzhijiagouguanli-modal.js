$(function () {
    $("#deptSave").click(function () {
        $.post("/admin/dept/sud?" + $('#deptForm').serialize(),
            function (result) {
                if (result.status) {
                    $('#modal-default').modal('hide');
                    debugger;
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });

    });
})