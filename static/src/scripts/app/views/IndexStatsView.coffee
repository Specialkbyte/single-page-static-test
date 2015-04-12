define [
  'jquery'
  'underscore'
  'jade.templates'
  'mixen'
  'mixens/BaseViewMixen'
  'mixens/ModelViewMixen'
], ($, _, jade, Mixen, BaseView, ModelView) ->
  class IndexStats extends Mixen(ModelView, BaseView)
    template: jade.indexStats

    render: =>
      loadingContext = @getRenderContext()

      percent = (((@model.get('amountRaised') / 100) / 100000) * 100) or 0
      percentWidth = if (percent > 100) then 100 else percent

      context =
        percentageWidth: percentWidth
        percentage: percent
      _.extend context, loadingContext
      _.extend context, @model.toJSON()

      @$el.html @template context
      @