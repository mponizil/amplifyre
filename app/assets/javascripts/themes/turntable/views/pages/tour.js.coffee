define [
  'underscore'
  'quilt'
  'list'
  'moment'
  'themes/turntable/views/pages/base/bare'
  'help!themes/default/views/content/concert'
  'jst!themes/turntable/templates/pages/tour'
], (_, {View}, List, moment, BarePage, ConcertView, jst) ->

  class AbbrCalendarView extends View

    monthJst = (colspan, month) -> "<th colspan='#{colspan}'>#{month}</th>"
    dateJst = (date) -> "<td><a>#{date}</a></td>"

    initialize: ->
      super
      render = _.bind(_.debounce(@render, 50), @)
      @listenTo(@collection, 'add remove sort', render)

    template: _.template """
      <table class='abbr-calendar'>
        <tr data-ref='months'></tr>
        <tr data-ref='dates'></tr>
      </table>
      """

    render: ->
      super

      months = @collection.countBy (model) ->
        moment(model.get('date')).format('MMMM')
      for month, colspan of months
        @$months.append(monthJst(colspan, month))

      @collection.each (model) =>
        date = moment(model.get('date')).format('D')
        @$dates.append(dateJst(date))

      return this

  class TourPage extends BarePage

    noConcertsJst = -> """
      <div class='media'>
        <div class='media-body'>Check back soon.</div>
      </div>"""

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
          el: @$next
          model: @collection.at(0)
        .render())
      else
        @$next.html(noConcertsJst())

      @views.push(new AbbrCalendarView
        el: @$future_calendar
        collection: @collection.subset('future')
      .render())

      @views.push(new List
        el: @$future
        view: ConcertView
        collection: @collection.subset('future')
      .render())

      @$future_concerts.toggleClass('hide', @collection.length < 2)

      return this
