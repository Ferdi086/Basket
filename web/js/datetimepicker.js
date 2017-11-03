$(function () {
    $('#datetimepicker6').datetimepicker({
        format: 'L'
    });
    $('#datetimepicker7').datetimepicker({
        format: 'L',
        useCurrent: false 
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        var startDate = new Date($('#datetimepicker6').val());
        var endDate = new Date($('#datetimepicker7').val());
        var delta = endDate - startDate;
        var tanpil = (Number(delta) / 86400000) +1;
        //$('#isi').text(tanpil);
        $("#lama").val(tanpil);
    });
});