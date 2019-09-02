$(function () {
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
                    "data": "name",
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
        dialog.load("modal/caidananniugongnengguanli-modal.html");
        dialog.modal();
    })
    $("#creat").click(function () {
        var dialog = window.parent.$('#modal-default1');
        dialog.empty();
        dialog.load("modal/caidananniugongnengguanli1-modal.html");
        dialog.modal();
    })

    $("#update").click(function () {
        var dialog = window.parent.$('#modal-default');
        dialog.empty();
        dialog.load("modal/zuzhijiagouguanli-modal.html");
        debugger;
        dialog.find("[name='code']").val("1");
        dialog.find("[name='name']").val("1");
        dialog.find("[name='order']").val("1");
        dialog.find("[name='remark']").val("1");
        dialog.find("[name='isuse']").val("1");
        dialog.find("[name='type']").val("1");
        dialog.modal();
    })
})