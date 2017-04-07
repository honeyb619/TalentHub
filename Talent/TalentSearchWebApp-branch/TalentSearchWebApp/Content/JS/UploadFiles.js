var selImageDiv = "";
var selVideoDiv = "";
var filesObj = [];
var ValidImageTypes = ["image/gif", "image/jpeg", "image/png"];
var ValidVideoTypes = ["video/mp4"];
var profile = localStorage.getItem("profile");
var talentId = "";
var profileUrl = "";
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
        $("#selectedFields").show();
    }
    filesObj = [];
    selImageDiv.innerHTML = "";
    selVideoDiv.innerHTML = "";
    var files = e.target.files;
    for (var i = 0; i < files.length; i++) {
        var f = files[i];

        if (ValidImageTypes.indexOf(f.type) > -1) {
            var fileObj = {};
            fileObj["File"] = f;
            filesObj.push(fileObj);
            selImageDiv.innerHTML = selImageDiv.innerHTML + "<div>" + "<input type='radio' id='" + f.name + "' name='radio' value='" + f.name + "' /><label class='filepath' for='" + f.name + "'><span></span>" + f.name + "</label><button data-label='" + f.name + "' class='icon-remove-sign'>X</button></div>";
        }
        else if (ValidVideoTypes.indexOf(f.type) > -1) {
            var fileObj = {};
            fileObj["File"] = f;
            filesObj.push(fileObj);
            selVideoDiv.innerHTML = selVideoDiv.innerHTML + "<div><span class='filepath'>" + f.name + "</span>" + "<button data-label='" + f.name + "' class='icon-remove-sign'>X</button></div>";
        }
    }
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
        $.ajax({
            url: '/Home/RegisterTalent',
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
            },
            error: function (xhr) {

            }
        })
    }
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
            filesObj[i].isProcessed = true;
            $.ajax({
                type: "POST",
                url: "/Home/TalentMedia",
                data: JSON.stringify(media),
                dataType: 'json',
                contentType: 'application/json',
                success: function (data, textStatus, jQxhr) {
                    for (var i = 0; i < filesObj.length; i++) {
                        if (!filesObj[i].isProcessed) {
                            return;
                        }
                        window.location = profileUrl;
                    }
                },
                error: function (jqXhr, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });

        }

    }
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
    $('#loading-image').bind('ajaxStart', function () {
        $(this).show();
    }).bind('ajaxStop', function () {
        $(this).hide();
    });
});