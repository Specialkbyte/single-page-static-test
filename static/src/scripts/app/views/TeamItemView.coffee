define [
  'jquery'
  'backbone'
  'jade.templates'
], ($, Backbone, jade) ->
  class TeamItem extends Backbone.View
    tagName: 'li'
    className: 'team'
    template: jade.teamListItem
    
    initialize: (options) =>
      if options.template
        @template = options.template

      if options.tagName
        @tagName = options.tagName

      @model.bind 'change sync', @render

      super

    render: =>
      @$el.html @template @model.getRenderContext()
      @