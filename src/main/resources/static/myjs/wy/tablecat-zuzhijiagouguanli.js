$(function () {
    $('.example-table').DataTable({
            "sAjaxSource": "admin/dept/list",
            "paging": true,
            "sidePagination": "client",
            "lengthChange": true,
            "searching": true,
            "info": true,
            "autoWidth": false,
            "autoHeight": false,
            "order": [[0, "asc"]],
            // "aoColumns": [{
            //     "mDataProp": "deptname",
            //     "sTitle": "组织名称",
            //     "sDefaultContent": "",
            //     "sClass": "center"
            // }, {
            //     "mDataProp": "deptcode",
            //     "sTitle": "组织编码",
            //     "sDefaultContent": "",
            //     "sClass": "center"
            // }, {
            //     "mDataProp": "remark",
            //     "sTitle": "备注",
            //     "sDefaultContent": "",
            //     "sClass": "center"
            // }],
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
    $('.example-table').on('draw.dt', function () {
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        })
    });

    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'

    })

})