@CharacterSearch = class CharacterSearch
  constructor: ->
    @modal = $('#modal')
    @input = $('#q')
    @submit = $('#modal .btn-primary')
    @bindEvents()

  searchCharactersTimeout = null

  specialKeyCodeMap =
    9: 'tab'
    27: 'esc'
    37: 'left'
    39: 'right'
    13: 'enter'
    38: 'up'
    40: 'down'

  bindEvents: ->
    @input.tagsinput
      maxTags: 1
      freeInput: false
    @input.on 'itemRemoved', (event) =>
      @itemRemoved event
    @input.on 'itemAdded', (event) =>
      @itemAdded event
    @input.tagsinput('input').keyup (event) =>
      @searchItems event
    @items().click (event) =>
      @itemClicked event
    @modal.on 'hidden.bs.modal', @hideModal
    @modal.on 'show.bs.modal', @showModal

  items: ->
    $('#characters .selectable')

  itemRemoved: (event) =>
    @items().removeClass 'active dark'
    @submit.addClass('disabled')
    @searchItems event

  itemAdded: (event) =>
    @input.tagsinput('input').val('')
    @submit.removeClass('disabled')

  ignoreUnwantedKeys: (event) =>
    return false if specialKeyCodeMap[event.which]

  searchItems: (event) =>
    return false if specialKeyCodeMap[event.which]
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

  hideModal: (event) =>
    @input.tagsinput('input').val('')
    @input.tagsinput 'removeAll'
    @itemRemoved event

  showModal: (event) =>
    @searchItems event
