$(document).ready(function(){
    $('#daypicker').datepicker({
        format: "dd-mm-yyyy",
        autoclose:true
    }).on('changeDate', function(e){
        $('#daypickerform').submit();
    });
});