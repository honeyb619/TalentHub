/// <reference path="/_references.js" />


function Success(data) {
    if (data != 0 && data != true && data != false) {
        if (confirm("Job created successfully. Do you want to submit another Job?")) {
            location = location.href;
        }
        else {
            $("#JobId").val(data);
            $("#btnJobSubmit").val("Update Job");
            $("#lgdJob").html("Update Job"); 
        }
    }
    else if (data == true) {
        alert("Job Updated Successfully.");
    } 
    else {
        alert("Something went wrong. Try after some time!");
    }
}

function Failure(data) {
    alert("Something went wrong. Try after some time!");
}
