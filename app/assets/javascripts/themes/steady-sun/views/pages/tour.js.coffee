define [
  'list'
  'themes/steady-sun/views/pages/base/bare'
  'help!themes/steady-sun/views/content/concert'
  'jst!themes/steady-sun/templates/pages/tour'
], (List, BarePage, ConcertView, jst) ->

  noConcertsJst = -> """
    <div class='media'>
      <div class='media-body'>Check back soon.</div>
    </div>"""

  class TourPage extends BarePage

    initialize: ->
      super
      render = _.bind(_.debounce(@render, 50), @)
      @listenTo(@collection, 'add remove sort', render)

    template: jst

    category: 'tour'

    render: ->
      super

      if @collection.length
        @views.push(new ConcertView
          el: @$next_show_container
          model: @collection.at(0)
        .render())
      else
        @$next_show_container.html(noConcertsJst())

      @views.push(new List
        el: @$future_shows_container
        view: ConcertView
        collection: @collection.subset('future')
      .render())

      @$future_shows.toggleClass('hide', @collection.length < 2)

      return this
