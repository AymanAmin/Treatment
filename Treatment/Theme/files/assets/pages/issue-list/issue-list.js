'use strict';
$(document).ready(function() {
    if ($("html").attr("dir") == "rtl") {
        $('#issue-list-table').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Arabic.json"
            }
        });
        $('#issue-list-table1').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Arabic.json"
            }
        });
        $('#issue-list-table2').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Arabic.json"
            }
        });
    }
    else {
        $('#issue-list-table').DataTable();
        $('#issue-list-table1').DataTable();
        $('#issue-list-table2').DataTable();
    }


    var progression1 = 0;

    var progress = setInterval(function() {

        $('.progress .issue-text1').text(progression1 + '%');
        $('.progress .issue-text1').css({ 'left': progression1 + '%' });
        $('.progress .issue-text1').css({ 'top': '-20px' });
        $('.progress .issue-bar1').css({ 'width': progression1 + '%' });

        if (progression1 == 70) {
            clearInterval(progress);

        } else
            progression1 += 1;

    }, 100);
});
