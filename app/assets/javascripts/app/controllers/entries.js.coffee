$ = jQuery.sub()
Entry = App.Entry

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Entry.find(elementID)


class New extends Spine.Controller
  events:
    'submit form': 'submit'
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active @render

  render: ->
    @html App.view('entries/new')

  submit: (e) ->
    e.preventDefault()
    entry = Entry.fromForm(e.target).save()
    @navigate '/entries', entry.id if entry

  back: ->
    @navigate '/entries'


class Edit extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Entry.find(id)
    @render()

  render: ->
    @html App.view('entries/edit')(@item)

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(e.target).save()
    @navigate '/entries'

  back: ->
    @navigate '/entries'


class Show extends Spine.Controller
  events:
    'click [data-type=edit]': 'edit'
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Entry.find(id)
    @render()

  render: ->
    @html App.view('entries/show')(@item)

  edit: ->
    @navigate '/entries', @item.id, 'edit'

  back: ->
    @navigate '/entries'


class Index extends Spine.Controller
  events:
    'click [data-type=edit]':    'edit'
    'click [data-type=destroy]': 'destroy'
    'click [data-type=show]':    'show'
    'click [data-type=new]':     'new'

  constructor: ->
    super
    Entry.bind 'refresh change', => @render()
    Entry.fetch()

  render: ->
    entries = Entry.all()
    @html App.view('entries/index')(entries: entries)

  edit: (e) ->
    item = $(e.target).item()
    @navigate '/entries', item.id, 'edit'

  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Are you sure?')

  show: (e) ->
    item = $(e.target).item()
    @navigate '/entries', item.id

  new: ->
    @navigate '/entries/new'


class App.Entries extends Spine.Stack
  controllers:
    index: Index
    edit:  Edit
    show:  Show
    new:   New

  routes:
    '/entries/new':      'new'
    '/entries/:id/edit': 'edit'
    '/entries/:id':      'show'
    '/entries':          'index'

  default: 'index'
  className: 'stack entries'
