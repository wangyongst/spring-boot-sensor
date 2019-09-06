$(function () {
    var mydatatable = $('#mydatatable').DataTable({
            "ajax": {
                "url": "admin/logs/list",
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
                    "title": "操作菜单",
                }, {
                    "data": "username",
                    "title": "操作用户",
                }, {
                    "data": "url",
                    "title": "url",
                }, {
                    "data": "method",
                    "title": "提交方式",
                }, {
                    "data": "ip",
                    "title": "ip",
                }
                , {
                    "data": "userusername",
                    "title": "操作者",
                }, {
                    "data": "createtime",
                    "title": "操作时间",
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

    $("#export").click(function () {
        $.get("/admin/logs/export");
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