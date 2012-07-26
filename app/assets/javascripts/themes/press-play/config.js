require.config({
  stubModules: [
    'jst',
    'text'
  ],
  exclude: [
    'text'
  ],
  paths: {
    jquery: '../..//jquery',
    underscore: '../../underscore',
    backbone: '../../backbone',
    quilt: '../../quilt',
    supermodel: '../../supermodel',
    list: '../../list',
    jplayer: '../../jplayer/jquery.jplayer.min',
    'jquery.easing': '../../jquery.easing.1.3',
    fancybox: '../../fancybox/jquery.fancybox.pack',
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
    jplayer: ['jquery'],
    'jquery.easing': ['jquery'],
    fancybox: ['jquery']
  }
});