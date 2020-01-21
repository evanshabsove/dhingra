$(function(){
  animateObjects(".gallery-index-item")
  animateObjects(".gallery-painting-div")

  function animateObjects(className) {
    $(className).css("opacity", "0")
    setTimeout(function() {
      $(className).toArray().forEach(function(item, index) {
        setTimeout(function(){
          $(item).animate({
            opacity: "1"
          }, 150)
        }, 250 + (50 * index))
      })
    }, 250)
  }
})
