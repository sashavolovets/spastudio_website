# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  initializeSlider()
  return

initializeSlider = ->
  $('#slider').unslider
    autoplay: true
    delay: 10000

  $('a.prev').addClass 'fa fa-angle-left arrow-left arrows-nav'
  $('a.next').addClass 'fa fa-angle-right arrow-right arrows-nav'
  $('.unslider-nav').addClass 'nav-dots'
  $('a.next, a.prev').text ''
  return
