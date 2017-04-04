document.addEventListener("turbolinks:load", function() {
$(function () {
  console.log('Star Rating')
  $('.star-rating').rating() // Call the rating plugin
})
})
