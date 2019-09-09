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

    $.get("/admin/dept/list?isuse=0",
        function (result) {
            if (result.status) {
                $.fn.zTree.init($("#treeDemo1"), setting2, result.data);
            }
        });

    var mydatatable = $('#mydatatable').DataTable({
            "ajax": {
                "url": "admin/dept/list",
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
                    "data": "name",
                    "title": "组织名称",
                }, {
                    "data": "code",
                    "title": "组织编码",
                }, {
                    "data": "remark",
                    "title": "备注",
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
        dialog.load("modal/zuzhijiagouguanli");
        dialog.modal();
    })

    /*----------点击按钮打开模态框------------*/
    $("#new2").click(function () {
        var dialog = window.parent.$('#modal-default');
        dialog.empty();
        dialog.load("modal/zuzhijiagouguanli?type=1");
        dialog.modal();
    })

    /*----------点击按钮打开模态框------------*/
    $("#new3").click(function () {
        var dialog = window.parent.$('#modal-default');
        dialog.empty();
        dialog.load("modal/zuzhijiagouguanli?type=2");
        dialog.modal();
    })

    $("#look").click(function () {
        var id = select();
        if (id == "") {
            alert("请先选择一条数据")
            return;
        }
        if (id.split(',').length > 1) {
            alert("只能选择一条数据")
            return;
        }
        var dialog = window.parent.$('#modal-default');
        dialog.empty();
        dialog.load("modal/zuzhijiagouguanli?look=1&id=" + id);
        dialog.modal();
    })

    $("#update").click(function () {
        var id = select();
        if (id == "") {
            alert("请先选择一条数据")
            return;
        }
        if (id.split(',').length > 1) {
            alert("只能选择一条数据")
            return;
        }
        var dialog = window.parent.$('#modal-default');
        dialog.empty();
        dialog.load("modal/zuzhijiagouguanli?id=" + id);
        dialog.modal();
    })


    $("#delete").click(function () {
        $.post("/admin/dept/sud?delete=1&ids=" + select(),
            function (result) {
                if (result.status) {
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });
    })

    $("#deleteall").click(function () {
        $.post("/admin/dept/sud?delete=2&ids=" + select(),
            function (result) {
                if (result.status) {
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });
    })

    $("#isuse").click(function () {
        $.post("/admin/dept/sud?lock=1&ids=" + select(),
            function (result) {
                if (result.status) {
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });
    })

    $("#export").click(function () {
        $.get("/admin/dept/export");
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