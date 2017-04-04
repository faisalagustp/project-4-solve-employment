document.addEventListener("turbolinks:load", function() {
  $("#star-rating").empty()
  var num = $('#rating').html()
  var star = "<span></span>"
  for(i = 0; i< num; i++){
    $("#star-rating").append(star)
  }

})
