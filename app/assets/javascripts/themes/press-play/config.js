require.config({
  stubModules: [
    'jst',
    'text'
  ],
  exclude: [
    'text'
  ],
  paths: {
    jquery: '../../jquery',
    underscore: '../../underscore',
    backbone: '../../backbone',
    quilt: '../../quilt',
    supermodel: '../../supermodel',
    list: '../../list',
    jquery_ui: '../../jquery-ui',
    jplayer: '../../jplayer/jquery.jplayer.min',
    easing: '../../jquery.easing.1.3',
    fancybox: '../../fancybox/jquery.fancybox.pack',
    'jquery.ui.widget': '../../jquery.fileupload/jquery.ui.widget',
    iframe_transport: '../../jquery.fileupload/jquery.iframe-transport',
    fileupload: '../../jquery.fileupload/jquery.fileupload',
    redactor: '../../redactor',
    moment: '../../moment',
    text: '../../text',
    jst: '../../jst'
  },
  shim: {
    backbone: {
      deps: ['underscore', 'jquery'],
      exports: 'Backbone'
    },
    underscore: {
      exports: '_'
    },
    jquery: {
      exports: 'jQuery'
    },
    jquery_ui: {
      deps: ['jquery'],
      exports: 'jQuery'
    },
    supermodel: {
      deps: ['backbone'],
      exports: 'Supermodel'
    },
    quilt: {
      deps: ['backbone'],
      exports: 'Quilt'
    },
    list: {
      deps: ['quilt'],
      exports: 'List'
    },
    jplayer: {
      deps: ['jquery'],
      exports: '$'
    },
    easing: {
      deps: ['jquery'],
      exports: '$'
    },
    fancybox: {
      deps: ['jquery'],
      exports: '$'
    },
    fileupload: {
      deps: ['jquery', 'iframe_transport']
    },
    redactor: {
      deps: ['jquery'],
      exports: '$'
    }
  }
});