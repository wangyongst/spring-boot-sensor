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
        }

    };

    $.get("/admin/dept/list?isuse=0",
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
                    window.parent.location.reload();
                } else {
                    alert(result.message);
                }
            });
    });

    $("#deptSelectSave").click(function () {
        $('#cat-select-click1').val(getSelectedZTreeId());
    });
})

function getSelectedZTreeId() {
    let idList = [];
    $.fn.zTree.getZTreeObj("treeDemo1").getCheckedNodes(true).map(val => idList.push(val.id));
    return idList.toString();
};