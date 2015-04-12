requirejs.config
  waitSeconds: 15
  baseUrl: '/build/scripts/app'
  paths:
    'jquery': '../../../components/jquery/dist/jquery',
    'underscore': '../../../components/underscore/underscore'
    'backbone': '../../../components/backbone/backbone'
    'moment': '../../../components/moment/moment'
    'humanize': '../../../components/humanize-plus/public/dist/humanize.min'
    'jade': '../../../components/jade/runtime'
    'raven': '../../../components/raven-js/dist/raven'
    'mixen': '../../../components/mixen/mixen.min'
    'foundation': '../../../components/bower-foundation/js/foundation/foundation'
    'foundation.topbar': '../../../components/bower-foundation/js/foundation/foundation.topbar'
    'slick': '../../../components/slick.js/slick/slick'
    'async': '../../../components/requirejs-plugins/src/async'
    'jsUri': '../../../components/jsUri/Uri'
    'jade.templates': '../../templates/jade'

  shim:
    underscore:
      exports: '_'

    backbone:
      deps: [
        'jquery'
        'underscore'
      ]
      exports: 'Backbone'

    jade:
      deps: [
        'moment'
      ]

    raven:
      exports: 'Raven'

    humanize:
      exports: 'Humanize'

    foundation:
      deps: [
        'jquery'
      ]
      exports: 'Foundation'

    'foundation.topbar':
      deps: ['foundation']