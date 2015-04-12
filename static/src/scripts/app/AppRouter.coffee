define [
  'backbone',
  'collections/TeamsCollection'
  'models/FiltersModel'
  'views/IndexView'
  'views/teams/ListPageView'
], (Backbone, Teams, Filters, IndexView, TeamsListPageView) ->
  class Router extends Backbone.Router
    routes:
      '':                   'index'
      'teams(/)':           'teams'

    initialize: ->
      @bodyContainer = $('#body-container')

    index: ->
      require ['async!//maps.googleapis.com/maps/api/js?v=3.exp&sensor=false'], (data) ->
        # do nothing just start loading its
      indexView = new IndexView
      @_showView indexView, ''

    teams: ->
      filters = new Filters
      teams = new Teams [],
        filters: filters
        limit: 20
      teams.fetch()
      teamsView = new TeamsListPageView
        collection: teams
        filters: filters
      @_showView teamsView, 'Teams List'

    _showView: (view, title) ->
      if @currentView?.close
        @currentView.close()

      @currentView = view
      @bodyContainer.html view.render().$el
      @_updateTitle(title)

    _updateTitle: (title) ->
      if title
        sep = ' | '
      else
        sep = ''

      document.title = title + sep + '''JailbreakHQ 2015 a global
        charity race in aid of Amnesty International and St.
        Vincent de Paul'''
