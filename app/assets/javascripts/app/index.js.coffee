#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  @view: (name) ->
    JST["app/views/#{name}"]

  constructor: ->
    super
    @entries = new App.Entries
    @append(@entries)
    Spine.Route.setup()    

window.App = App