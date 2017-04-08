function CreateProductionCompany() {
    var $myForm = $('#Talentform');
    if (!$myForm.context.forms[0].checkValidity()) {
        $("#formsubmit").click();
        return;
    }
    var ProductionCompanyName = $("#ProductionCompanyName").val();
    var ContactPerson = $("#ContactPerson").val();
    var PhoneNumber = $("#PhoneNumber").val();
    var EmailId = $("#EmailId").val();
    var RegionId = $("#RegionField").val();
    var DescriptionNotes = $("#DescriptionNotes").val();

    var ProductionCompany = {
        "ProductionCompanyName": ProductionCompanyName, "ContactPerson": ContactPerson,
        "PhoneNumber": PhoneNumber,
        "EmailId": EmailId, "RegionId": RegionId,
        "DescriptionNotes": DescriptionNotes
    };

    $.post("/Admin/CreateProductionCompany", ProductionCompany,
        function (data) {
            if (data == 0) { location = location.href; }
            else {
                alert("Production Company Created successfull");
            }
        }, 'json');
}