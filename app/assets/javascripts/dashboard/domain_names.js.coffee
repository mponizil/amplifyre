# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

DomainName =

  search: (domain_name, process) ->

    [keyword, tld] = domain_name.split('.')

    $.ajax
      type: 'GET'
      url: '/domain_names/search'
      data: { keyword, tld }
      success: process

$ ->

  $domains = $('[data-domains]')

  $('[data-form]').submit (e) ->

    e.preventDefault()

    domain_name = $('input[name=domain_name]').val()
    DomainName.search domain_name, (data) ->
      $domains.empty()
      $domains.append("<li><button class='btn'>#{domain_name}</button></li>") for domain_name in data
