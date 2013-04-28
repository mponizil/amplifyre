define [
  'jquery'
], ($) ->

  $.extend

    trimHTML: (html) ->
      $html = $(html)
      for el, start in $html
        break unless $(el).is(':empty')
      for el, end in $html by -1
        break unless $(el).is(':empty')
      $html[start..end][0]?.outerHTML or ""

  return $
