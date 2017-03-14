# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

open = false

$(document).on 'ready', ->
  initializeSlider()
  return

initializeSlider = ->
  if $('.unslider').length == 0
    $('#slider').unslider
      autoplay: true
      delay: 10000

    $('a.prev').addClass 'fa fa-angle-left arrow-left arrows-nav'
    $('a.next').addClass 'fa fa-angle-right arrow-right arrows-nav'
    $('.unslider-nav').addClass 'nav-dots'
    $('a.next, a.prev').text ''

    $('a#hamburger').click ->
      if !open
        $('a#hamburger').addClass('close').focus()
        $('div#navigation').slideDown 200
        open = true
      else
        $('a#hamburger').removeClass 'close'
        $('div#navigation').slideUp 200
        open = false
      return
  return

$(document).on 'click', '.nav-link', ->
  $('.nav-link.active').removeClass 'active'
  $(this).addClass 'active'
  if window.location.pathname == '/'
    scrollToPage $(this).attr('data-target')
  return

$(document).on 'click', '.nav-link-mobile', ->
  if window.location.pathname == '/'
    scrollToPage $(this).attr('data-target')
  $('a#hamburger').removeClass 'close'
  $('div#navigation').slideUp 200
  open = false
  return

scrollToPage = (page) ->
  $page = $('#' + page)
  offset = $page.offset().top - 59
  $('html, body').animate { scrollTop: offset }, 800
  return

updateMenu = ->
  scroll = $(this).scrollTop();
  if $('#tour').is ':visible'
    switch true
      when scroll < ($('#services').offset().top - 300)
        $('.nav-link.active').removeClass('active');
        $('.nav-link[data-target=main]').addClass('active');
      when (scroll >= ($('#services').offset().top - 300)) && (scroll < ($('#tour').offset().top - 300))
        $('.nav-link.active').removeClass('active');
        $('.nav-link[data-target=services]').addClass('active');
      when (scroll >= ($('#tour').offset().top - 300)) && (scroll < ($('#contacts').offset().top - 300))
        $('.nav-link.active').removeClass('active');
        $('.nav-link[data-target=tour]').addClass('active');
      when scroll >= ($('#contacts').offset().top - 300)
        $('.nav-link.active').removeClass('active');
        $('.nav-link[data-target=contacts]').addClass('active');
  else
    switch true
      when scroll < ($('#services').offset().top - 300)
        $('.nav-link.active').removeClass('active');
        $('.nav-link[data-target=main]').addClass('active');
      when (scroll >= ($('#services').offset().top - 300)) && (scroll < ($('#contacts').offset().top - 300))
        $('.nav-link.active').removeClass('active');
        $('.nav-link[data-target=services]').addClass('active');
      when scroll >= ($('#contacts').offset().top - 300)
        $('.nav-link.active').removeClass('active');
        $('.nav-link[data-target=contacts]').addClass('active');
  return

$(window).on 'scroll', ->
  if window.location.pathname == '/'
    updateMenu()
  return

