# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require_self
#= require_tree .

$ ->

  $form = $('[data-prelaunch]')
  $input = $form.find('[name=email]')
  $loader = $('[data-loader]')
  $results = $('[data-results]')

  $input.focus()
  $loader.addClass('hidden')
  $results.addClass('hidden')

  $form.submit (e) ->

    $loader.removeClass('hidden')

    $results.addClass('hidden')
    $results.removeClass('results-error')

    e.preventDefault()

    data = email: $input.val()

    $.ajax
      type: 'POST'
      contentType: 'application/json'
      url: '/subscribe'
      data: JSON.stringify(data)
      dataType: 'json'
      complete: ->
        $loader.addClass('hidden')
        $results.removeClass('hidden')
      success: (resp) ->
        $results.html('Thank you for subscribing. We will notify you when your invitation is ready.')
      error: (xhr) ->
        resp = JSON.parse(xhr.responseText)
        $results.html(resp.error)
        $results.addClass('results-error')
        $input.focus()
