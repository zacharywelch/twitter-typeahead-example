@CharacterSearch = class CharacterSearch
  constructor: ->
    @input = $('#q')
    @bindEvents()

  searchCharactersTimeout = null

  bindEvents: ->
    @input.tagsinput
      maxTags: 1
      freeInput: false
    @input.on 'itemRemoved', (event) =>
      @deselectItems event
    @input.tagsinput('input').keyup (event) =>
      @searchItems event
    @items().click (event) =>
      @itemClicked event

  items: ->
    $('#characters .selectable')

  deselectItems: (event) =>
    @items().removeClass 'active dark'

  searchItems: (event) =>
    if searchCharactersTimeout
      clearTimeout searchCharactersTimeout
    searchCharactersTimeout = setTimeout((=>
      params = q: escape(@input.tagsinput('input').val())
      $.get '/characters/search', params, (data) ->
        return
    ), 150)

  itemClicked: (event) =>
    @input.tagsinput 'removeAll'
    @input.tagsinput 'add', $(event.currentTarget).data('name')
    @items().removeClass 'active dark'
    $(event.currentTarget).addClass 'active dark'
