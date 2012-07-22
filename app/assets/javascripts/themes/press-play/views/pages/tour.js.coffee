PressPlay.Views.Pages ||= {}

class PressPlay.Views.Pages.TourPageView extends PressPlay.Views.Page

  template: JST["themes/press-play/templates/tour"]

  render: ->
    super()
    $(".thm a").fancybox
      overlayColor: '#000000'