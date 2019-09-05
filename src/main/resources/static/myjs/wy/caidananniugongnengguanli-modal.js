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

    $.get("/admin/permission/list?isuse=0",
        function (result) {
            if (result.status) {
                $.fn.zTree.init($("#treeDemo6"), setting2, result.data);
            }
        });

    $("#permissionSave").click(function () {
        $.post("/admin/permission/sud?" + $('#permissionForm').serialize(),
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
        $('#cat-select-click1').val(getSelectedZTreeId());
        $('#cat-select').css('display','none');
        $('#mubu').css('display','none');
    });
})

function getSelectedZTreeId() {
    let idList = [];
    $.fn.zTree.getZTreeObj("treeDemo1").getCheckedNodes(true).map(val => idList.push(val.id));
    return idList.toString();
};