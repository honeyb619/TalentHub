$(document).ready(function () {

    $("#dialog").dialog({
        autoOpen: false,
        width: 400,
        buttons: [
		{
		    text: "Ok",
		    click: function () {
		        $(this).dialog("close");
		    }
		},
		{
		    text: "Cancel",
		    click: function () {
		        $(this).dialog("close");
		    }
		}
	]
});

$('#btnAdd').click(
                    function (e) {
                        $('#list1 > option:selected').appendTo('#list2');
                        e.preventDefault();
                    });

$('#btnAddAll').click(
                function (e) {
                    $('#list1 > option').appendTo('#list2');
                    e.preventDefault();
                });

$('#btnRemove').click(
                function (e) {
                    $('#list2 > option:selected').appendTo('#list1');
                    e.preventDefault();
                });

$('#btnRemoveAll').click(
                function (e) {
                    $('#list2 > option').appendTo('#list1');
                    e.preventDefault();
                });

    

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
                    SearchJob();
                else
                    alert("Not delete something Wrong");
            });
    }
}

function AssignTalent(J_ID) {
    $("#dialog").dialog("open");
}