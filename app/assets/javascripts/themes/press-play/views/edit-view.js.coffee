define ['underscore', 'quilt'], (_, Quilt) ->

  class EditView extends Quilt.View

    initialize: ->
      super

      if @EditView
        _.defaults @EditView, @

    render: ->
      super

      if @EditView
        @views.push((new @EditView(el: @$el)).render())
