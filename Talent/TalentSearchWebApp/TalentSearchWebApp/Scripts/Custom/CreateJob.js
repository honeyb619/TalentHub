/// <reference path="/_references.js" />
$(document).ready(function () {



});

function Success(data) {
    if (data != 0) {
        if (confirm("Do you want to submit another Job?")) {
            location = location.href;
        }
        else {
            $("#JobId").val(data);
            $("#btnJobSubmit").val("Update Job");
            $("#lgdJob").html("Update Job"); 
        }
    }
    else {
        alert("Something went wrong. Try after some time!");
    }
}

function Failure(data) {
    alert("Something went wrong. Try after some time!");
}
