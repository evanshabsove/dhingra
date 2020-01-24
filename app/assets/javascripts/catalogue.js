$(function(){

  var previous;

  $("#province").on('focus', function () {
    previous = this.value.toLowerCase().split(' ').join('_');
  }).change(function() {
    $("#" + previous).toggle()

    previous = this.value.toLowerCase().split(' ').join('_');
    $("#" + previous).toggle()
  });

  $("#download-specific-catalogue").on('click', function(e){
    var array = $("#catalogue-array").data('array');
    var province = $("#province").val().toLowerCase().split(' ').join('_');
    var region = $("#" + province).find('select').val()
    var fileName;
    for (var i = 0; i < array.length; i++) {
      if (array[i].toUpperCase().replace(/\s/g, '').indexOf(region.toUpperCase().replace(/\s/g, '')) !== -1) {
        fileName = array[i]
      }
    }
    $(this).attr('href', "/documents/catalogues/" + fileName)
  })



})
