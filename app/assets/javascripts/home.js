
$(function(){
  $("#enter-now-button").on("click", function() {
      $("body").scrollTo(0,500);
  });

  $(document).scroll(function(){
    $('.arrow').css({
      display: "none"
    })
  })

})
