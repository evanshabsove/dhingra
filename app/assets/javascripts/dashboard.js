$( document ).on('turbolinks:load', function() {

  $("#create_painting_button").on("click", function(){
    event.preventDefault();
    var parent = $(this).parent()
    var id = parent.attr("id")
    console.log($(this).serialize());
    $.ajax({
      url: "/galleries/" + id + "/paintings",
      method: "post",
      dataType: "JSON",
      data: $("#create_painting_button").serialize()
    }).done(function(responseData){
      $("#all_paintings").html(responseData.html)
    });
  });

})
