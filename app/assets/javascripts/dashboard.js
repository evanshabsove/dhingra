$( document ).on('turbolinks:load', function() {

  // $("#create_painting_button").on("submit", function(event){
  //   event.preventDefault();
  //   var parent = $(this).parent()
  //   var id = parent.attr("id")
  //   console.log("here");
  //   console.log($(this).serialize());
  //   $.ajax({
  //     url: "/galleries/" + id + "/paintings/poop",
  //     method: "post",
  //     dataType: "JSON",
  //     data: $(this).serialize()
  //   }).done(function(responseData){
  //     console.log(responseData.html);
  //     console.log("hello");
  //     $("#all_paintings").html(responseData.html)
  //   });
  // });

  $(document).on('click','#create_painting_button', {}, function(){
    event.preventDefault();
    var parent = $(this).parent()
    var id = parent.attr("id")
    $.ajax({
      url: "/galleries/" + id + "/paintings",
      method: "post",
      dataType: "JSON",
      data: $("#new_painting").serialize()
    }).done(function(responseData){
      $("#all_paintings").html(responseData.html)
    });
  });

})
