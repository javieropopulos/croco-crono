// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'
import './src/application.scss'

// $(document).on('turbolinks:load', function() {
//   sortable('#tasks', {
//     items: 'tr'
//   });
//   if (typeof sortable('#tasks')[0] != 'undefined'){
//     sortable('#tasks')[0].addEventListener('sortupdate', function(e) {
//       var dataIDList = $(this).children().map(function(index){
//          $(this).find( ".position" ).text(index + 1)
//          return "task[]=" + $(this).data("id");
//       }).get().join("&");
//       Rails.ajax({
//           url: $(this).data("url"),
//           type: "PATCH",
//           data: dataIDList,
//         });
//     });
//   }
// })

// $(document).on('turbolinks:load', function() {
//   sortable('#comments', {
//     items: 'tr'
//   });
//   if (typeof sortable('#comments')[0] != 'undefined'){
//     sortable('#comments')[0].addEventListener('sortupdate', function(e) {
//       var dataIDList = $(this).children().map(function(index){
//          $(this).find( ".position" ).text(index + 1)
//          return "comment[]=" + $(this).data("id");
//       }).get().join("&");
//       Rails.ajax({
//           url: $(this).data("url"),
//           type: "PATCH",
//           data: dataIDList,
//         });
//     });
//   }
// })
