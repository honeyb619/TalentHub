$(document).ready(function () {

    //$('#dialog').dialog({ 'autoOpen': false });

    $("#gridArea").on("click", "thead th a, tfoot a", function (e) {
        e.preventDefault();

        var param = $(this).attr('href').split('?')[1];
        PageSortJobData(param);
    });
});

function QueryStringToJSON(list, params) {
    var pairs = location.search.slice(1).split('&');

    params.forEach(function (param) {
        param = param.split('=');
        list[param[0]] = decodeURIComponent(param[1] || '');
    });

    return list;
}

function SearchJob() {

    var jobEntitiy = {};
    jobEntitiy.ProductionCompanyName = $("#txt").val();

    $.ajax({
        url: '/Admin/GetJobsData?_=' + new Date().getTime(),
        datatype: "html",
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(jobEntitiy),
        processData: false,
        cache: false,
        success: function (data) {
            $('#gridArea').html(data);
        },
        error: function (xhr) {
            alert('Error!');
        }
    });
}

function PageSortJobData(param) {

    var url = '/Admin/GetJobsData?' + param;
    $.ajax({
        url: url,
        type: 'GET',
        data: '',
        dataType: 'html',
        success: function (data) {
            $('#gridArea').html(data);
        },
        error: function () {
            alert('Error!');
        }
    });
}


function DeleteJob(J_ID) {
    if (confirm("Are You Sure Delete Selected Job?")) {
        var data = { 'jobId': J_ID }
        $.post('/Admin/DeleteJob', data,
            function (data) {
                if (data == true)
                    location = location.href;
                else
                    alert("Not delete something Wrong");
            });
    }
}