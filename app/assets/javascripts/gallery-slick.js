$( document ).on('turbolinks:load', function() {
  $(".center").slick({
    dots: true,
    infinite: true,
    centerMode: true,
    slidesToShow: 3,
    slidesToScroll: 3
  });
});
