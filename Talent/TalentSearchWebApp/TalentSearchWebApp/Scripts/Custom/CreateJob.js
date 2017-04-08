/// <reference path="/_references.js" />
$(document).ready(function () {



});

function Success(data) {
    alert(data);
}

function SubmitJob() {

    var objVmInsertTalent = {};
    objVmInsertTalent.FirstName = $("#FirstNameFileld").val();
    objVmInsertTalent.LastName = $("#LastNameField").val();
    objVmInsertTalent.EmailId = $("#EmailField").val();
    objVmInsertTalent.AlternateEmailId = $("#AlternateEmailField").val();
    objVmInsertTalent.Gender = $("#GenderField").val();

    objVmInsertTalent.Age = $("#AgeField").val();
    objVmInsertTalent.Hobbies = $("#HobbiesField").val();
    objVmInsertTalent.Mobile = $("#MobileField").val();
    objVmInsertTalent.Phone = $("#PhoneField").val();
    objVmInsertTalent.PostalAddress = $("#PostalField").val();

    objVmInsertTalent.RegionId = $("#RegionField").val();
    objVmInsertTalent.EmergencyName = $("#EmergencyNameField").val();
    objVmInsertTalent.EmergencyNumber = $("#EmergencyNumberField").val();
    objVmInsertTalent.Height = $("#HeightField").val();
    objVmInsertTalent.Nationality = $("#NationalityField").val();

    objVmInsertTalent.EyeColor = $("#EyeColorField").val();
    objVmInsertTalent.Ethnicity = $("#EthicityField").val();
    objVmInsertTalent.Waist = $("#WaistField").val();
    objVmInsertTalent.HairColor = $("#HairColorField").val();
    objVmInsertTalent.ChestSize = $("#ChestSizeField").val();

    objVmInsertTalent.HipSize = $("#HipSizeField").val();

    if ($("#profilePublicField").length > 0) {
        if ($("#profilePublicField").is(":checked")) {
            objVmInsertTalent.IsPublic = true;
        }
        else {
            objVmInsertTalent.IsPublic = false;
        }
    }
    else {
        objVmInsertTalent.IsPublic = true;
    }


    objVmInsertTalent.LanguageIds = $('select#AccentField').val();
    objVmInsertTalent.Skills = [];

    var skills = {};
    skills.SkillName = "";
    skills.SkillId = $("#skill1NameField").val();
    skills.Description = $("#skill1DescField").val();
    objVmInsertTalent.Skills.push(skills);

    skills = {};
    skills.SkillName = "";
    skills.SkillId = $("#skill2NameField").val();
    skills.Description = $("#skill2DescField").val();
    objVmInsertTalent.Skills.push(skills);

    skills = {};
    skills.SkillName = "";
    skills.SkillId = $("#skill3NameField").val();
    skills.Description = $("#skill3DescField").val();
    objVmInsertTalent.Skills.push(skills);

    localStorage.setItem('profile', JSON.stringify(objVmInsertTalent));

    window.location = "../Home/UploadFiles";

    //$.ajax({
    //    url: '/Home/RegisterTalent',
    //    dataType: "json",
    //    type: "POST",
    //    contentType: 'application/json; charset=utf-8',
    //    data: JSON.stringify(objVmInsertTalent),
    //    processData: false,
    //    cache: false,
    //    success: function (data) {
    //        alert(data);
    //    },
    //    error: function (xhr) {
    //        alert('error');
    //    }
    //})

}