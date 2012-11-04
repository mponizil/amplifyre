define ['quilt'], (Quilt) ->

  # The same as Quilt views except don't render a template into @$el
  # and ignore Quilt.attributes
  class View extends Quilt.View

    render: ->
      view.destroy?() while view = @views.pop()

      return this
