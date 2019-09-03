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

    $.get("/admin/permission/list",
        function (result) {
            if (result.status) {
                $.fn.zTree.init($("#treeDemo7"), setting, result.data);
            }
        });

    var mydatatable = $('#mydatatable').DataTable({
            "ajax": {
                "url": "admin/permission/list",
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
                        return "<input type='checkbox' class='minimal' name ='btSelectItem' value='" + data + "'/>";
                    }
                }, {
                    "data": "type",
                    "title": "类型",
                    "render": function (data, type, row) {
                        if (data == 1) return "菜单";
                        else return "按钮";
                    }
                }, {
                    "data": "pname",
                    "title": "权限标识",
                }, {
                    "data": "updatetime",
                    "title": "更新时间",
                }, {
                    "data": "ischeck",
                    "title": "是否二次验证",
                    "render": function (data, type, row) {
                        if (data == 1) return "是";
                        else return "否";
                    }
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


    /*----------点击按钮打开模态框------------*/
    $("#new").click(function () {
        var dialog = window.parent.$('#modal-default');
        dialog.empty();
        dialog.load("modal/caidananniugongnengguanli?type=1");
        dialog.modal();
    })
    $("#creat").click(function () {
        var dialog = window.parent.$('#modal-default1');
        dialog.empty();
        dialog.load("modal/caidananniugongnengguanli?type=2");
        dialog.modal();
    })

    $("#look").click(function () {
        var id = select();
        if(id == ""){
            alert("请先选择一条数据")
            return;
        }
        if (id.split(',').length > 1){
            alert("只能选择一条数据")
            return;
        }
        var dialog = window.parent.$('#modal-default');
        dialog.empty();
        dialog.load("modal/caidananniugongnengguanli?look=1&id=" + id);
        dialog.modal();
    })

    $("#update").click(function () {
        var id = select();
        if(id == ""){
            alert("请先选择一条数据")
            return;
        }
        if (id.split(',').length > 1){
            alert("只能选择一条数据")
            return;
        }
        var dialog = window.parent.$('#modal-default');
        dialog.empty();
        dialog.load("modal/caidananniugongnengguanli?id=" + id);
        dialog.modal();
    })

    $("#delete").click(function () {
        $.post("/admin/permission/sud?delete=1&ids=" + select(),
            function (result) {
                if (result.status) {
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });
    })

    $("#deleteall").click(function () {
        $.post("/admin/permission/sud?delete=2&ids=" + select(),
            function (result) {
                if (result.status) {
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });
    })

    $("#isuse").click(function () {
        $.post("/admin/permission/sud?isuse=1&ids=" + select(),
            function (result) {
                if (result.status) {
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });
    })

    $("#export").click(function () {
        $.get("/admin/permission/export");
    })
})

function select() {
    var ids = "";
    $("input[name=btSelectItem]").each(function () {
        if ($(this).prop('checked')) {
            ids += "," + $(this).val();
        }
    });
    if (ids.length > 1) ids = ids.substr(1);
    return ids;
}