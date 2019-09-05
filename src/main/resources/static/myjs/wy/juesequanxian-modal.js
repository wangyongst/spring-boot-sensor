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
                    window.parent.location.reload();
                } else {
                    alert(result.message);
                }
            });
    });

    $("#permissionSelectSave").click(function () {
        $.post("/admin/role/permission?roleid" + $('#id') + "&permissionids=" + getSelectedZTreeId(),
            function (result) {
                if (result.status) {
                    $('#modal-default').modal('hide');
                } else {
                    alert(result.message);
                }
            });
        $('#cat-select-click1').val(getSelectedZTreeId());
    });
})

function getSelectedZTreeId() {
    let idList = [];
    $.fn.zTree.getZTreeObj("treeDemo2").getCheckedNodes(true).map(val => idList.push(val.id));
    return idList.toString();
};