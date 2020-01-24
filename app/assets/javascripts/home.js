
$(function(){
  $("#enter-now-button").on("click", function() {
      $("body").scrollTo(0,500);
  });

  $(document).scroll(function(){
    $('.arrow').css({
      display: "none"
    })
  })

  $("#code").keyup(function(){
    var value = $(this).val().toLowerCase();
    if (value == 'alan') {
      $('#download-wholesale').removeClass('disabled')
      $('#download-specific-catalogue').removeClass('disabled')
    }
  })

})
