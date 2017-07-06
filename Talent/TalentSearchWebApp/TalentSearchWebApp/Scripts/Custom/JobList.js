var jobTalentStatus = "";
var jobIdForTalentAssociation = 0;
var jobTalentAssociationObj = {};
var clickedJobId = "";
var jobTalentRoles = "";
var EnquiryObj = {};
var JobId = "";
$(document).ready(function () {

    $("#dialog").dialog({
        autoOpen: false,
        width: 1000,
        height: 500,
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
		        ResetSearch();
		        $(this).dialog("close");
		    }
		},
        {
            text: "",
            id: "companyNotify",
            label: "Company",
            click: function () {
                var self = $("#companyNotify");
                setAddNotificationObj(self);
            }
        },
        ]
    });
    $("#companyNotify").append("<span class='fa fa-envelope'> Company</span>")
    $("#htmldialog").dialog({
        autoOpen: false,
        width: 1000,
        height: 500,
        title: "Edit Email",
        buttons: [
		{
		    text: "Send Notification",
		    click: function () {
		        sendEnquiry();
		    }
		},
		{
		    text: "Close",
		    click: function () {
		        $("#htmldialog").empty();
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
                            markup += "<td id='name_row_" + talentId + "'><select class='status' id='statusselect" + talentId + "'>" + jobTalentStatus + "</select></td>";
                            markup += "<td id='name_row_" + talentId + "'><select class='role' id='roleselect" + talentId + "'>" + jobTalentRoles + "</select></td>";
                            markup += "<td><button data-label='Talent' onclick='setAddNotificationObj(this)' style='margin-left:1em;'><span class='fa fa-envelope'> Talent</span></button>"
                            markup += "<a  onclick='deleteAssociation(" + talentId + "," + JobId + ",this)' style='margin-left:1em;'><span class='fa fa-trash'></span></a></td>"
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
                        markup += "<td id='name_row_" + talentId + "'><select class='status' id='statusselect" + talentId + "'>" + jobTalentStatus + "</select></td>";
                        markup += "<td id='name_row_" + talentId + "'><select class='role' id='roleselect" + talentId + "'>" + jobTalentRoles + "</select></td>";
                        markup += "<td><button data-label='Talent' onclick='setAddNotificationObj(this)' style='margin-left:1em;'><span class='fa fa-envelope'> Talent</span></button>"
                        markup += "<a  onclick='deleteAssociation(" + talentId + "," + JobId + ",this)' style='margin-left:1em;'><span class='fa fa-trash'></span></a></td>"
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

    $.get('/Admin/GetRegions',
               function (data) {
                   Enumerable.From(data).ForEach(function (opt) {
                       $('#regiontxt').append($('<option>',
        {
            value: opt.RegionName,
            text: opt.RegionName
        }));
                   });

               });
});

function LoadJobRole(jobid) {
    jobTalentRoles = "";
    var roles = Enumerable.From(jobmodel.ListJobEntity).Where(function (job) { return job.JobId == jobid }).ToArray()[0].Role.split(',')

    jobTalentRoles += '<option value="">--Please Select--</option>';
    for (var i = 0, l = roles.length; i < l; i++) {

        jobTalentRoles += '<option value="' + roles[i] + '">' + roles[i] + '</option>';
    }
}


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


function ResetSearch() {
    $("#regiontxt").val("");
    $("#ethicitytxt").val("");
    $("#searchcondition").val("");
    $("#conditiontxt").val("");
    $("#rangesearchcondition").val("");
    $("#minconditiontxt").val("");
    $("#maxconditiontxt").val("");
}

function ResetJobs() {
    ResetSearch();
    GetTalentsForJob();
}

function advancedSearch(jobId) {
    var advancedsearchparam = "/Admin/GetTalentsForJob?jobId=" + jobId + "&AdvancedSearch=true&";
    if ($("#regiontxt").val()) {
        advancedsearchparam = advancedsearchparam + "Region=" + $("#regiontxt").val() + "&";
    }
    if ($("#ethicitytxt").val()) {
        advancedsearchparam = advancedsearchparam + "Ethicity=" + $("#ethicitytxt").val() + "&";
    }
    if ($("#gendertxt").val()) {
        advancedsearchparam = advancedsearchparam + "Gender=" + $("#gendertxt").val() + "&";
    }
    if ($("#searchcondition").val() && $("#conditiontxt").val()) {
        advancedsearchparam = advancedsearchparam + $("#searchcondition").val() + "=" + $("#conditiontxt").val();
    }
    if ($("#rangesearchcondition").val() && $("#minconditiontxt").val() && $("#maxconditiontxt").val()) {
        advancedsearchparam = advancedsearchparam + $("#rangesearchcondition").val() + "=" + $("#minconditiontxt").val() + '-' + $("#maxconditiontxt").val();
    }

    if (advancedsearchparam != "/Admin/GetTalentsForJob?jobId=" + jobId + "&AdvancedSearch=true&")
        return advancedsearchparam;
    else
        return '/Admin/GetTalentsForJob?jobId=' + jobId;
}

function GetTalentsForJob(jobId) {
    if (jobId) {
        clickedJobId = jobId;
    }
    else {
        jobId = clickedJobId;
    }
    JobId = jobId;
    LoadJobRole(jobId);

    var url = advancedSearch(jobId);

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
                $("#list1").empty();
                $("#list2").empty();
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
                        markup += "<td id='name_row_" + prop.TalentId + "'><select class='status' id='statusselect" + prop.TalentId + "'>" + jobTalentStatus + "</select></td>";
                        markup += "<td id='name_row_" + prop.TalentId + "'><select class='role' id='roleselect" + prop.TalentId + "'>" + jobTalentRoles + "</select></td>";
                        markup += "<td><button data-label='Talent' onclick='setAddNotificationObj(this)' style='margin-left:1em;'><span class='fa fa-envelope'> Talent</span></button>"
                        markup += "<a  onclick='deleteAssociation(" + prop.TalentId + "," + jobId + ",this)' style='margin-left:1em;'><span class='fa fa-trash'></span></a></td>"
                        markup += "</tr>";

                        $("#tblAssignedTalents tbody").append(markup);

                        $("#statusselect" + prop.TalentId).val(prop.StatusId);
                        $("#roleselect" + prop.TalentId).val(prop.Role);
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
        var statusobj = $(this).find(".status");
        var roleobj = $(this).find(".role");
        var statusValue = $(statusobj).find(":selected").val();
        var statustext = $(statusobj).find(":selected").text();
        var roleValue = $(roleobj).find(":selected").val();
        var roletext = $(roleobj).find(":selected").text();
        if (statusValue == "" || statustext == "--Please Select--") {
            alert("Please select the status of " + $(this).find("td:first").text() + "(" + $(this).find("td:nth-child(1)").text() + ")");
            $(statusobj).find("select").focus();
            isSave = false;
            return false;
        }
        else {

            var talentId = $(this).attr('id').split('_')[1];
            jobTalentAssociationObj.TalentStatusIds.push({ TalentId: talentId, StatusId: statusValue, Role: roleValue });
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
    var notificationUrl = "";
    if (jobIdForTalentAssociation == 0) {
        alert("Something went wrong. Please try after some time!");
        return;
    }

    if ($(btnObj).attr('label') == 'Company') {
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
        if (notificationType == 'talent') {
            var talentId = $(obj).closest("tr").attr('id').split('_')[1];
            jobTalentAssociationObj.TalentStatusIds.push({ TalentId: talentId, StatusId: statusValue });
        }
        else {
            $("#tblAssignedTalents tbody tr").each(function () {
                var talentId = $(this).attr('id').split('_')[1];
                var statusValue = $(this).find(":selected").val();
                jobTalentAssociationObj.TalentStatusIds.push({ TalentId: talentId, StatusId: statusValue });
            });


        }
    }

    if (notificationType == 'talent') {
        notificationUrl = '/Admin/GetNotificationDetails';
    }
    else {
        notificationUrl = '/Admin/GetCompanyNotificationDetails';
    }

    $.ajax({
        url: notificationUrl,
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(jobTalentAssociationObj),
        processData: false,
        cache: false,
        success: function (data) {
            GetNotificationMessage(data, notificationType).then(function (response) {
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
    EnquiryObj = {};
    if (notificationType == 'company') {
        url = "/Email/ProductionCompanyEmail"
        EnquiryObj["EmailId"] = notifyData[0]["ProductionEmail"];
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
            $("#htmldialog").append(response);
            makeContentEditable(notificationType);
            $("#htmldialog").dialog("open");
            //sendEnquiry(EnquiryObj).then(function () {
            //}, function (error) {
            //    console.log(error);
            //});
        },
        error: function (xhr) {
            console.log(xhr);
        }
    });

}

function createEditor(controlid, placeholder) {
    new Medium({
        element: document.getElementById(controlid),
        placeholder: placeholder,
        autofocus: true,
        autoHR: true,
        mode: Medium.richMode,
        tags: null,
        pasteAsText: false
    });
}

function makeContentEditable(notificationType) {
    createEditor('emailStart', 'Add...');
    $(".addcomment").each(function () {
        new Medium({
            element: document.getElementById(this.id),
            placeholder: 'Add...',
            autofocus: true,
            autoHR: true,
            mode: Medium.richMode,
            tags: null,
            pasteAsText: false
        });
    });
    if (notificationType != 'company') {
        createEditor('JobDetails', 'Add...');
    }
    createEditor('Greetings', 'Add...');
}

function sendEnquiry() {
    $(".Medium-placeholder").each(function () {
        if ($(this).html().indexOf('Add...') != -1) {
            $(this).remove();
        }
    });
    EnquiryObj["Message"] = $("#htmldialog").html();
    return $.ajax({
        url: '/Email/SendBulkEmail',
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(EnquiryObj),
        processData: false,
        cache: false,
        success: function (data) {
            $("#htmldialog").empty();
            $("#htmldialog").dialog("close");
            alert("Your notification has been sent.")
        },
        error: function (xhr) {
            alert('Please try after some time.');
        }
    });

}

function deleteAssociation(talentId, JobId, object) {
    console.log(talentId + "," + JobId + "," + object);
    return $.ajax({
        url: '/Admin/DeleteJobTalentAssociation?talentId=' + talentId + '&jobId=' + JobId,
        type: "GET",
        dataType: 'json',
        processData: false,
        cache: false,
        success: function (data) {
            var deleteRow = $(object).closest('tr');
            $(deleteRow).remove();
        },
        error: function (xhr) {
            alert('Please try after some time.');
        }
    });
}
