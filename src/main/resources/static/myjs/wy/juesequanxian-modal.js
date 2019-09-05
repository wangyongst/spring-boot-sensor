$(function () {

    var setting = {
        view: {
            selectedMulti: false
        },
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        edit: {
            enable: false
        }
    };

    $.get("/admin/permission/list?isuse=0",
        function (result) {
            if (result.status) {
                $.fn.zTree.init($("#treeDemo2"), setting, result.data);
            }
        });

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