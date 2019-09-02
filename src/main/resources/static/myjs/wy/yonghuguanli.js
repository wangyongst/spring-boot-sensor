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

    var mydatatable = $('#mydatatable').DataTable({
            "ajax": {
                "url": "admin/user/list",
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
                    "data": "workno",
                    "title": "工号",
                }, {
                    "data": "username",
                    "title": "登录账号",
                }, {
                    "data": "name",
                    "title": "姓名",
                }, {
                    "data": "mobile",
                    "title": "联系电话",
                }, {
                    "data": "dept",
                    "title": "所属部门",
                    "render": function (data, type, row) {
                        if(data != null)  return data.name;
                        else return null;
                    }
                }, {
                    "data": "role",
                    "title": "角色",
                    "render": function (data, type, row) {
                        if(data != null)  return data.name;
                        else return null;
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
        dialog.load("modal/yonghuguanli-modal.html");
        dialog.modal();
    })
    $("#update").click(function () {
        alert(select());
    })


    $("#delete").click(function () {
        $.post("/admin/user/sud?delete=1&ids=" + select(),
            function (result) {
                if (result.status) {
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });
    })

    $("#deleteall").click(function () {
        $.post("/admin/user/sud?delete=2&ids=" + select(),
            function (result) {
                if (result.status) {
                    $('#mydatatable').DataTable().ajax.reload();
                } else {
                    alert(result.message);
                }
            });
    })

    $("#export").click(function () {
        $.get("/admin/user/export");
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