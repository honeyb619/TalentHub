var selImageDiv = "";
var selVideoDiv = "";
var filesObj = [];
var ValidImageTypes = ["image/gif", "image/jpeg", "image/png"];
var ValidVideoTypes = ["video/mp4"];
var profile = localStorage.getItem("profile");
var enquiryProfile = localStorage.getItem("profile");
var talentId = "";
var profileUrl = "";
var emailEnquiryPic = "";
var sendEnquiryFlag = false;
var alreadyUploadedFiles = [];
var isProfileUpdate = false;
document.addEventListener("DOMContentLoaded", init, false);

function init() {
    document.querySelector('#fileupload').addEventListener('change', handleFileSelect, false);
    selImageDiv = document.querySelector("#selectedImages");
    selVideoDiv = document.querySelector("#selectedVideos");
}

function handleFileSelect(e) {

    if (!e.target.files) {
        $("#selectedFields").hide();
        return;
    }
    else {
        $("#newFiles").removeClass("displayNone");
        $("#selectedFields").show();
    }
    selImageDiv.innerHTML = "";
    selVideoDiv.innerHTML = "";
    var files = e.target.files;
    for (var i = 0; i < files.length; i++) {
        var f = files[i];
        if (f.type.split('/')[0].indexOf('image') > -1) {
            var fileObj = {};
            fileObj["File"] = f;
            filesObj.push(fileObj);
            //              selImageDiv.innerHTML = selImageDiv.innerHTML + "<div>" + "<input type='radio' id='" + f.name + "' name='radio' value='" + f.name + "' /><label class='filepath' for='" + f.name + "'><span></span>" + f.name + "</label><button data-label='" + f.name + "' class='icon-remove-sign'>X</button></div>";
        }
        else if (ValidVideoTypes.indexOf(f.type) > -1) {
            var fileObj = {};
            fileObj["File"] = f;
            filesObj.push(fileObj);
            //                selVideoDiv.innerHTML = selVideoDiv.innerHTML + "<div><span class='filepath'>" + f.name + "</span>" + "<button data-label='" + f.name + "' class='icon-remove-sign'>X</button></div>";
        }

    }
    Enumerable.From(filesObj).ForEach(function (fileObj) {
        if (fileObj.File.type.split('/')[0].indexOf('image') > -1) {
            selImageDiv.innerHTML = selImageDiv.innerHTML + "<div>" + "<input type='radio' id='" + fileObj.File.name + "' name='radio' value='" + fileObj.File.name + "' /><label class='filepath' for='" + fileObj.File.name + "'><span></span>" + fileObj.File.name + "</label><button data-label='" + fileObj.File.name + "' class='icon-remove-sign' style='background-color:#337ab7;'>X</button></div>";
        }
        else if (ValidVideoTypes.indexOf(fileObj.File.type) > -1) {
            selVideoDiv.innerHTML = selVideoDiv.innerHTML + "<div><span class='filepath'>" + fileObj.File.name + "</span>" + "<button data-label='" + fileObj.File.name + "' class='icon-remove-sign' style='background-color:#337ab7;'>X</button></div>";
        }
    });


    $('.icon-remove-sign').click(function () {
        var button = $(this);
        var filename = $(this).attr("data-label");
        for (var i = 0; i < filesObj.length; i++) {
            if (filesObj[i].File.name == filename) {
                filesObj.splice(i, 1);
            }
        }
        $(button).parent().hide();
    });

}

function submitFiles() {
    if (profile) {
        $('.submit').button('loading');
        var url = "/Home/RegisterTalent";
        if (JSON.parse(profile).TalentId) {
            url = "/Admin/UpdateTalent";
            isProfileUpdate = true;
        }
        $.ajax({
            url: url,
            dataType: "json",
            type: "POST",
            contentType: 'application/json; charset=utf-8',
            data: profile,
            processData: false,
            cache: false,
            success: function (data) {
                talentId = data;
                profileUrl = "../Home/Profile?ProfileId=" + talentId;
                if (filesObj.length > 0) {
                    for (var i = 0; i < filesObj.length; i++) {
                        var formData = new FormData();
                        var file = filesObj[i].File;
                        var postUrl = "";
                        if (ValidImageTypes.indexOf(file.type) > -1) {
                            postUrl = "/Home/UploadFile?isImage=true";
                        }
                        else {
                            postUrl = "/Home/UploadFile?isImage=false";
                        }
                        formData.append("fileObj", file);
                        FileSubmit(formData, postUrl).then(function (response) {
                            insertFilePath(JSON.parse(response));
                        }, function (error) {
                            console.log(error);
                        });
                    }
                }
                else {
                    localStorage.clear();
                    checkProfilePic().then(function (response) { window.location = profileUrl; }
                                  , function (error) { });

                }
            },
            error: function (xhr) {

            }
        })
    }
}


function sendTalent() {
    var sendProfiles = {};
    sendProfiles.candidateList = [];
    var candidate = {};
    candidate.RegionName = JSON.parse(enquiryProfile).RegionName;
    candidate.CandidateName = JSON.parse(enquiryProfile).FirstName + " " + JSON.parse(enquiryProfile).LastName;
    candidate.ProfileId = talentId;
    candidate.profilePicPath = emailEnquiryPic;
    sendProfiles.candidateList.push(candidate);
    return $.ajax({
        url: '/Email/NotificationEmailFormat',
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(sendProfiles),
        processData: false,
        cache: false,
        success: function (data) {
            if (!isProfileUpdate) {
                EnquiryObj = {};
                EnquiryObj["Message"] = data;
                EnquiryObj["Subject"] = "Registeration Notification";
                sendEnquiry(EnquiryObj).then(function () {
                    console.log("Message Sent Successfully")
                }, function (error) {
                    //   alert('Please try after some time.');
                });
            }
        },
        error: function (xhr) {
            // alert('Please try after some time.');
        }
    });
}

function sendEnquiry(messageObj) {
    return $.ajax({
        url: '/Admin/SendEmail',
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(messageObj),
        processData: false,
        cache: false,
        success: function (data) {

        },
        error: function (xhr) {
        }
    });

}



function insertFilePath(response) {
    for (var i = 0; i < filesObj.length; i++) {
        if (response.FileName.indexOf(filesObj[i].File.name) > -1) {
            filesObj[i].FilePath = response.path;
            if ($("input[type='radio']:checked").val()) {
                if ($("input[type='radio']:checked").val().indexOf(filesObj[i].File.name) > -1) {
                    filesObj[i].isProfilePic = true;
                }
            }
            var media = {};
            if (ValidImageTypes.indexOf(filesObj[i].File.type) > -1) {
                media.MediaType = "Image";
            }
            else {
                media.MediaType = "Video";
            }
            media.TalentId = talentId;
            media.MediaPath = filesObj[i].FilePath;
            media.MimeType = filesObj[i].File.type;
            media.isProfilePic = filesObj[i].isProfilePic ? filesObj[i].isProfilePic : false;
            media.MediaName = filesObj[i].File.name;
            if (media.isProfilePic) {
                emailEnquiryPic = media.MediaPath.split('/').pop();
            }
            filesObj[i].isProcessed = true;
            $.ajax({
                type: "POST",
                url: "/Home/TalentMedia",
                data: JSON.stringify(media),
                dataType: 'json',
                contentType: 'application/json',
                success: function (data, textStatus, jQxhr) {
                    var goflag = Enumerable.From(filesObj).Where(function (fileObj) {
                        return !fileObj.isProcessed;
                    }).ToArray();

                    if (goflag.length == 0 && !sendEnquiryFlag) {
                        sendEnquiryFlag = true;
                        localStorage.clear();
                        sendTalent().then(function (response) {
                            checkProfilePic().then(function (response) { window.location = profileUrl; }
                                , function (error) { });
                        }, function (error) {
                            sendEnquiryFlag = false;
                            window.location = profileUrl;
                        });
                    }
                    else
                        return;
                },
                error: function (jqXhr, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });

        }

    }
}

function checkProfilePic() {

    var promise = new Promise(function (resolve, reject) {
        var selectedFileName = $("input[type='radio']:checked").val() ? $("input[type='radio']:checked").val() : "";
        var profileMedia = [];
        if (selectedFileName) {
            profileMedia = Enumerable.From(alreadyUploadedFiles).Where(function (uploadedFile) {
                return ($("input[type='radio']:checked").val().indexOf(uploadedFile.MediaName) > -1);
            }).ToArray();
        }
        if (profileMedia.length > 0) {
            if (!profileMedia[0].isProfilePic) {
                profileMedia[0].isProfilePic = true;
                $.ajax({
                    type: "POST",
                    url: "/Home/TalentMediaProfileUpdate",
                    data: JSON.stringify(profileMedia[0]),
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (data, textStatus, jQxhr) {
                        resolve("success");
                    },
                    error: function (jqXhr, textStatus, errorThrown) {
                        reject(errorThrown);
                    }
                });

            }
            else resolve("success");
        }
        else {
            resolve("success");
        }
    });
    return promise;

}

function FileSubmit(formData, postUrl) {
    return new Promise(function (resolve, reject) {
        var xhr = new XMLHttpRequest();

        xhr.open("POST", postUrl, true);
        xhr.addEventListener("load", function (evt) {
            resolve(evt.target.responseText);
        }, false);
        xhr.addEventListener("error", function (evt) {
            reject("not uploaded successfully");
        }, false);
        xhr.send(formData);

    });

}

$(document).ready(function () {
    if (JSON.parse(profile).TalentId) {
        var AlreadyUploadedFiles = document.querySelector("#AlreadyUploadedFiles");
        var originalProfile = JSON.parse(localStorage.getItem("originalProfile"));
        Enumerable.From(originalProfile.vmMedias).OrderBy("$.MediaType").ForEach(function (media) {
            if (media.MediaType == "Image") {
                alreadyUploadedFiles.push(media);
                if (media.isProfilePic)
                    AlreadyUploadedFiles.innerHTML = AlreadyUploadedFiles.innerHTML + "<div>" + "<input type='radio' checked id='" + media.MediaName + "' name='radio' value='" + media.MediaName + "' /><label class='filepath' for='" + media.MediaName + "'><span></span>" + media.MediaName + "</label><button data-label='" + media.MediaId + "' class='deleteMedia' style='background-color:#337ab7;'>X</button></div>";
                else
                    AlreadyUploadedFiles.innerHTML = AlreadyUploadedFiles.innerHTML + "<div>" + "<input type='radio' id='" + media.MediaName + "' name='radio' value='" + media.MediaName + "' /><label class='filepath' for='" + media.MediaName + "'><span></span>" + media.MediaName + "</label><button data-label='" + media.MediaId + "' class='deleteMedia' style='background-color:#337ab7;'>X</button></div>";
            }
            else {
                alreadyUploadedFiles.push(media);
                AlreadyUploadedFiles.innerHTML = AlreadyUploadedFiles.innerHTML + "<div><span class='filepath'>" + media.MediaName + "</span>" + "<button data-label='" + media.MediaId + "' class='deleteMedia' style='background-color:#337ab7;'>X</button></div>";
            }

            $('.deleteMedia').click(function () {
                var button = $(this);
                var MediaId = $(this).attr("data-label");
                $.ajax({
                    type: "GET",
                    url: "/Admin/DeleteMedia?MediaId=" + MediaId,
                    contentType: 'application/json',
                    success: function (data, textStatus, jQxhr) {
                        $(button).parent().hide();
                    },
                    error: function (jqXhr, textStatus, errorThrown) {
                        console.log(errorThrown);
                    }
                });

                //$.get("/Admin/DeleteMedia?MediaId=" + MediaId, function (data) {
                //    $(button).parent().hide();
                //}, function (error) { console.log(error); });

            });
        });
        if (alreadyUploadedFiles.length > 0) {
            $("#oldFiles").removeClass("displayNone");
        }
        $("#AlreadyUploadedFiles").show();
    }
    else {
        $("#AlreadyUploadedFiles").hide();
    }
    $('#loading-image').bind('ajaxStart', function () {
        $(this).show();
    }).bind('ajaxStop', function () {
        $(this).hide();
    });
});