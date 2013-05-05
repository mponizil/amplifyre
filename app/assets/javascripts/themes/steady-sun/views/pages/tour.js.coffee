define [
  'list'
  'at-ss/views/pages/base/plain'
  'help!at-ss/views/content/concert'
  'jst!at-ss/templates/pages/tour'
], (List, PlainPage, ConcertView, jst) ->

  noConcertsJst = -> """
    <div class='media'>
      <div class='media-body'>Check back soon.</div>
    </div>"""

  class TourPage extends PlainPage

    initialize: ->
      super
      render = _.bind(_.debounce(@render, 50), @)
      @listenTo(@collection, 'add remove sort', render)

    template: jst

    render: ->
      super

      $('.container:first').attr('id', 'tour-page')

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
