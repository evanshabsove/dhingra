$(function(){
  $(".gallery-painting").on('mouseover', function() {
    $(this).siblings(1).fadeIn("fast");
  })
  $(".gallery-painting").on("mouseout", function() {
    $(this).siblings(1).fadeOut("fast");
  })
})
