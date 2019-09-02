$(function () {
    $("#blackSave").click(function () {
        $.post("/admin/blacklist/sud?type=1&ip=" + $('#black').val(),
            function (result) {
                alert(result.message);
            });
    })
    $("#whiteSave").click(function () {
        $.post("/admin/blacklist/sud?type=2&ip=" + $('#white').val(),
            function (result) {
                alert(result.message);
            });
    })
})