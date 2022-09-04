$(document).ready(function(){
    $("#yearpicker").datepicker({
        format: "yyyy",
        viewMode: "years",
        minViewMode: "years",
        autoclose:true
    }).on('changeDate', function(e){
        $('#yearpickerform').submit();
    });
});