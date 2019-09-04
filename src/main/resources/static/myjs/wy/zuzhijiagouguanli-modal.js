$(function () {

    var setting2 = {
        check: {
            enable: true,
            chkStyle: "radio",
            radioType: "all"
        },
        view: {
            dblClickExpand: false
        },
        data: {
            simpleData: {
                enable: true
            }
        },

    };

    $.get("/admin/dept/list",
        function (result) {
            if (result.status) {
                $.fn.zTree.init($("#treeDemo1"), setting2, result.data);
            }
        });

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