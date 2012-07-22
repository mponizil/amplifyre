PressPlay.Views.Pages ||= {}

class PressPlay.Views.Pages.PhotosPageView extends PressPlay.Views.Page

  template: JST["themes/press-play/templates/photos"]

  render: ->
    super()
    $("#pics-ul a").fancybox
      overlayColor: '#000000'