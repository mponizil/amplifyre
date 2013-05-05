define [
  'jquery'
], ($) ->

  tagger = /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)<\/\1>/g

  $.extend

    trimHTML: (html) ->
      $html = if html.match(tagger) then $(html) else $("<p>#{html}</p>")
      for el, start in $html
        break unless $(el).is(':empty')
      for el, end in $html by -1
        break unless $(el).is(':empty')
      html = ""
      html += $el.outerHTML for $el in $html[start..end]
      return html

  return $
