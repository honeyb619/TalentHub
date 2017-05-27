﻿var jobTalentStatus = "";
var jobIdForTalentAssociation = 0;
var jobTalentAssociationObj = {};

$(document).ready(function () {

    $("#dialog").dialog({
        autoOpen: false,
        width: 1000,
        buttons: [
		{
		    text: "Save",
		    click: function () {
		        saveJobTalentAssociation();
		    }
		},
		{
		    text: "Close",
		    click: function () {
		        $(this).dialog("close");
		    }
		}
        ]
    });

    LoadjobTalentStatus();

    $('#btnAdd').click(
                    function (e) {
                        $('#list1 option:selected').each(function () {
                            var name = $(this).text();
                            var email = $(this).attr('mailid');
                            var talentId = $(this).val();

                            var table = document.getElementById("tblAssignedTalents");
                            var markup = "<tr id='row_" + talentId + "'>";
                            markup += "<td id='name_row_" + talentId + "'>" + name + "</td>";
                            markup += "<td id='name_row_" + talentId + "'>" + email + "</td>";
                            markup += "<td id='name_row_" + talentId + "'><select id='select" + talentId + "'>" + jobTalentStatus + "</select></td>";
                            markup += "</tr>";

                            $("#tblAssignedTalents tbody").append(markup);
                        });

                        $('#list1 > option:selected').appendTo('#list2');
                        e.preventDefault();
                    });

    $('#btnAddAll').click(
                function (e) {
                    $('#list1 option').each(function () {
                        var name = $(this).text();
                        var email = $(this).attr('mailid');
                        var talentId = $(this).val();

                        var table = document.getElementById("tblAssignedTalents");
                        var markup = "<tr id='row_" + talentId + "'>";
                        markup += "<td id='name_row_" + talentId + "'>" + name + "</td>";
                        markup += "<td id='name_row_" + talentId + "'>" + email + "</td>";
                        markup += "<td id='name_row_" + talentId + "'>SS</td>";
                        markup += "</tr>";

                        $("#tblAssignedTalents tbody").append(markup);
                    });
                    $('#list1 > option').appendTo('#list2');
                    e.preventDefault();
                });

    $('#btnRemove').click(
                function (e) {
                    $('#list2 option:selected').each(function () {
                        var talentId = $(this).val();
                        document.getElementById("row_" + talentId + "").outerHTML = "";
                    });

                    $('#list2 > option:selected').appendTo('#list1');
                    e.preventDefault();
                });

    $('#btnRemoveAll').click(
                function (e) {
                    $('#list2 option').each(function () {
                        var talentId = $(this).val();
                        document.getElementById("row_" + talentId + "").outerHTML = "";
                    });

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
    jobEntitiy.ProductionCompanyName = $("#Productiontxt").val();
    jobEntitiy.JobName = $("#Jobtxt").val();
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

function GetTalentsForJob(jobId) {
    var url = '/Admin/GetTalentsForJob?jobId=' + jobId;

    jobIdForTalentAssociation = jobId;

    $('#list1').find('option').remove();
    $('#list2').find('option').remove();
    $("#tblAssignedTalents tbody").empty();

    $.ajax({
        url: url,
        type: 'GET',
        data: '',
        dataType: 'html',
        success: function (data) {
            if (data == null || data == undefined) {
                alert('Talent does not exist!');
            }
            else {
                var obj = jQuery.parseJSON(data);

                for (var i = 0, l = obj.length; i < l; i++) {
                    var prop = obj[i];
                    // skip loop if the property is from prototype
                    if (prop.IsAssigned == "Unassigned") {
                        $("#list1").append('<option value="' + prop.TalentId + '" mailId="' + prop.EmailId + '">' + prop.Name + '</option>');
                    }
                    else {
                        $("#list2").append('<option value="' + prop.TalentId + '" mailId="' + prop.EmailId + '">' + prop.Name + '</option>');
                        var table = document.getElementById("tblAssignedTalents");
                        var markup = "<tr id='row_" + prop.TalentId + "'>";
                        markup += "<td id='name_row_" + prop.TalentId + "'>" + prop.Name + "</td>";
                        markup += "<td id='name_row_" + prop.TalentId + "'>" + prop.EmailId + "</td>";
                        markup += "<td id='name_row_" + prop.TalentId + "'><select id='select" + prop.TalentId + "'>" + jobTalentStatus + "</select></td>";
                        markup += "<td id='name_row_" + prop.TalentId + "'><a data-label='Company' onclick='setAddNotificationObj(this)'><span class='fa fa-envelope'> C</span></a>"
                        markup += "<a data-label='Talent' onclick='setAddNotificationObj(this)' style='margin-left:1em;'><span class='fa fa-envelope'> T</span></a></td>"
                        markup += "</tr>";

                        $("#tblAssignedTalents tbody").append(markup);

                        $("#select" + prop.TalentId).val(prop.StatusId);

                    }
                }

                $("#dialog").dialog("open");
            }
        },
        error: function () {
            alert('Error!');
        }
    });
}


function LoadjobTalentStatus() {
    var url = '/Admin/LoadjobTalentStatus';
    jobTalentStatus = "";
    $.ajax({
        url: url,
        type: 'GET',
        data: '',
        dataType: 'html',
        success: function (data) {
            if (data == null || data == undefined) {
                console.log("Job talent association status dropdown not loaded successfully!");
            }
            else {
                var obj = jQuery.parseJSON(data);

                jobTalentStatus += '<option value="">--Please Select--</option>';
                for (var i = 0, l = obj.length; i < l; i++) {
                    var prop = obj[i];
                    // skip loop if the property is from prototype

                    jobTalentStatus += '<option value="' + prop.SubCategoryId + '">' + prop.SubCategoryValue + '</option>';
                }
            }
        },
        error: function () {
            alert('Error!');
        }
    });
}

function saveJobTalentAssociation() {

    var isSave = false;

    if (jobIdForTalentAssociation == 0) {
        alert("Something went wrong. Please try after some time!");
        return;
    }

    jobTalentAssociationObj.JobId = jobIdForTalentAssociation;
    jobTalentAssociationObj.TalentStatusIds = [];

    $('#tblAssignedTalents tbody tr').each(function () {
        var obj = $(this).find("td:last");
        var statusValue = $(obj).find(":selected").val();
        var statustext = $(obj).find(":selected").text();

        if (statusValue == "" || statustext == "--Please Select--") {
            alert("Please select the status of " + $(this).find("td:first").text() + "(" + $(this).find("td:nth-child(1)").text() + ")");
            $(obj).find("select").focus();
            isSave = false;
            return false;
        }
        else {

            var talentId = $(this).attr('id').split('_')[1];
            jobTalentAssociationObj.TalentStatusIds.push({ TalentId: talentId, StatusId: statusValue });
            isSave = true;
        }

    });

    if (isSave) {
        $.ajax({
            url: '/Admin/SaveJobTalentAssociation?_=' + new Date().getTime(),
            datatype: "json",
            type: "POST",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(jobTalentAssociationObj),
            processData: false,
            cache: false,
            success: function (data) {
                if (data == true) {
                    alert('Job successfully associated with talents!');
                }
                else {
                    alert('Error!');
                }
            },
            error: function (xhr) {
                alert('Error!');
            }
        });
    }
}


function setAddNotificationObj(btnObj) {
    var notificationType = "";
    if (jobIdForTalentAssociation == 0) {
        alert("Something went wrong. Please try after some time!");
        return;
    }

    if ($(btnObj).attr('data-label') == 'Company') {
        notificationType = 'company';
    }
    else {
        notificationType = 'talent';
    }
    jobTalentAssociationObj.JobId = jobIdForTalentAssociation;
    jobTalentAssociationObj.TalentStatusIds = [];

    var rowobj = $(btnObj).closest("tr");
    var obj = $(rowobj).find("select");
    var statusValue = $(obj).find(":selected").val();
    var statustext = $(obj).find(":selected").text();

    if (statusValue == "" || statustext == "--Please Select--") {
        return false;
    }
    else {

        var talentId = $(obj).closest("tr").attr('id').split('_')[1];
        jobTalentAssociationObj.TalentStatusIds.push({ TalentId: talentId, StatusId: statusValue });
    }

    $.ajax({
        url: '/Admin/GetNotificationDetails',
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(jobTalentAssociationObj),
        processData: false,
        cache: false,
        success: function (data) {
            GetNotificationMessage(data, notificationType).then(function (response) {
                alert("Your notification has been sent.")
            }, function (error) {
                alert("Error while sending Notification.")
            });
        },
        error: function (xhr) {
            console.log(xhr);
        }
    });
}

function GetNotificationMessage(notifyData, notificationType) {
    var url = "";
    var EnquiryObj = {};
    if (notificationType == 'company') {
        url = "/Email/ProductionCompanyEmail"
        EnquiryObj["EmailId"] = notifyData["ProductionEmail"];
    }
    else {
        url = "/Email/TalentEmail";
        EnquiryObj["EmailId"] = notifyData["TalentEmail"];
    }
    EnquiryObj["Subject"] = "Jade Talent Notification";

    return $.ajax({
        url: url,
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(notifyData),
        processData: false,
        cache: false,
        success: function (response) {
            EnquiryObj["Message"] = response;
            sendEnquiry(EnquiryObj).then(function () {
            }, function (error) {
                console.log(error);
            });
        },
        error: function (xhr) {
            console.log(xhr);
        }
    });

}
function sendEnquiry(messageObj) {
    return $.ajax({
        url: '/Email/SendBulkEmail',
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(messageObj),
        processData: false,
        cache: false,
        success: function (data) {

        },
        error: function (xhr) {
            alert('Please try after some time.');
        }
    });

}
