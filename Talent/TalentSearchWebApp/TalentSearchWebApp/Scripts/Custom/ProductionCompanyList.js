$(document).ready(function () {

    //$('#dialog').dialog({ 'autoOpen': false });

    $("#gridArea").on("click", "thead th a, tfoot a", function (e) {
        e.preventDefault();

        var param = $(this).attr('href').split('?')[1];
        PageSortProductionCompanyData(param);
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

function SearchProductionCompany() {

    var productionCompanyEntitiy = {};
    productionCompanyEntitiy.ProductionCompanyName = $("#txt").val();

        $.ajax({
            url: '/Admin/GetProductionCompanyData?_=' + new Date().getTime(),
            datatype: "html",
            type: "POST",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(productionCompanyEntitiy),
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

function PageSortProductionCompanyData(param) {

    var url = '/Admin/GetProductionCompanyData?' + param;
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

function CreateProductionCompany() {
    //var div = $("#dialog");
    //div.load("/Admin/CreateProductionCompany", function () {
    //    div.dialog({
    //        modal: true,
    //        width: 500,
    //        height: 400,
    //        title: "Add New Production Company",
    //        resizable: false
    //    });
    //});
    window.location = "/Admin/CreateProductionCompany";
}

function EditProductionCompany(P_ID) {
    window.location = "/Admin/EditProductionCompany?productionCompanyId=" + P_ID;
    //var ph = $("#dialog");
    //ph.load("/Admin/EditProductionCompany?productionCompanyId=" + P_ID, function () {
    //    $("#dialog").dialog({
    //        modal: true,
    //        width: 500,
    //        height: 400,
    //        title: "Edit Production Company",
    //        resizable: false
    //    });
    //});
}

function DeleteProductionCompany(P_ID) {
    if (confirm("Are You Sure Delete Selected Production Company?")) {
        var data = { 'productionCompanyId': P_ID }
        $.post('/Admin/Delete', data,
            function (data) {
                if (data == true)
                    SearchProductionCompany();
                else
                    alert("Not deleted something Wrong");
            });
    }
}