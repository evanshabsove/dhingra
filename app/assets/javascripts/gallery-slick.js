$(function(){  $(".center").slick({
    dots: true,
    infinite: true,
    centerMode: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    adaptiveHeight: true

  });

  if ($(".slick-current").length) {
    value = $(".slick-current").attr("class")[0]
    $("#" + value).fadeIn()
  }

  $(".center").on('afterChange', function(event, slick, direction){
    value = $(".slick-current").attr("class")[0]
    $("#" + value).fadeIn()
  })

  $(".center").on('beforeChange', function(event, slick, direction){
    value = $(".slick-current").attr("class")[0]
    $("#" + value).fadeOut(505)
  })
});
