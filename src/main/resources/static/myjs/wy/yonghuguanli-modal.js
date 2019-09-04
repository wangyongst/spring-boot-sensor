$(function () {
    debugger;
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

    $.get("/admin/dept/list?isuse=0",
        function (result) {
            if (result.status) {
                $.fn.zTree.init($("#treeDemo1"), setting2, result.data);
            }
        });

    var roletable = $('#roletable').DataTable({
            "ajax": {
                "url": "admin/role/list?isuse=0",
                "dataSrc": "data",
            },
            "paging": true,
            "sidePagination": "client",
            "lengthChange": true,
            "searching": true,
            "info": true,
            "autoWidth": false,
            "autoHeight": false,
            "order": [[0, "asc"]],
            "columns": [
                {
                    "data": "id",
                    "render": function (data, type, row) {
                        return "<input type='checkbox' class='minimal' name ='roleSelectItem' value='" + data + "'/>";
                    }
                }, {
                    "data": "name",
                    "title": "角色名称",
                }],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "对不起，查询不到任何相关数据",
                "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_条记录",
                "sInfoEmtpy": "找不到相关数据",
                "sInfoFiltered": "数据表中共为 _MAX_ 条记录)",
                "sProcessing": "正在加载中...",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": " 上一页 ",
                    "sNext": " 下一页 ",
                    "sLast": " 最后一页 "
                },
            }
        }
    );


    $("#userSave").click(function () {
        $.post("/admin/user/sud?" + $('#userForm').serialize(),
            function (result) {
                if (result.status) {
                    $('#modal-default').modal('hide');
                } else {
                    alert(result.message);
                }
            });
    });

    $("#deptSelectSave").click(function () {
        $('#cat-select-click1').val(getSelectedZTreeId());
    });

    $("#roleSelectButton").click(function () {
        var ids = select();
        if (ids.split(",").length > 1) {
            alert("只能选择一个角色");
            return;
        }
        $('#cat-select-click3').val(ids);
    });
})

function getSelectedZTreeId() {
    let idList = [];
    $.fn.zTree.getZTreeObj("treeDemo1").getCheckedNodes(true).map(val => idList.push(val.id));
    return idList.toString();
};

function select() {
    var ids = "";
    $("input[name=roleSelectItem]").each(function () {
        if ($(this).prop('checked')) {
            ids += "," + $(this).val();
        }
    });
    if (ids.length > 1) ids = ids.substr(1);
    return ids;
}