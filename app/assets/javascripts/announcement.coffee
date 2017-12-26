# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.show_event_form = ->
  x = document.getElementById('event_form')
  value = document.getElementById('announcement_is_event').checked
  if value
    x.style.display = 'block'
  else
    x.style.display = 'none'
  return

window.show_registration_form = ->
    value = document.getElementById('registration').value;
    if value == 'URL'
        x = document.getElementById('registration_options_url')
        x.style.display = 'block'
        x = document.getElementById('registration_options_person_location')
        x.style.display = 'none'
    else if value == 'Person or Location'
        x = document.getElementById('registration_options_person_location')
        x.style.display = 'block'
        x = document.getElementById('registration_options_url')
        x.style.display = 'none'
    else
        x = document.getElementById('registration_options_url')
        x.style.display = 'none'
        x = document.getElementById('registration_options_person_location')
        x.style.display = 'none'
    return