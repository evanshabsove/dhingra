$(function(){  $(".center").slick({
    dots: true,
    infinite: true,
    centerMode: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    rows: 1,
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
