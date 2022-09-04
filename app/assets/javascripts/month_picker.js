$(document).ready(function(){
    $("#monthpicker").datepicker( {
        format: "mm-yyyy",
        startView: "months",
        minViewMode: "months",
        autoclose:true
    }).on('changeDate', function(e){
        $('#monthpickerform').submit();
    });
});