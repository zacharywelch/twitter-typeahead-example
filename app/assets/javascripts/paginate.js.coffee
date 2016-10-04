$ ->
  # Configure infinite table
  $('.infinite-table, .infinite-scroll').infinitePages
    debug: true
    buffer: 3000
    context: '.scroll'
    loading: ->
      $(this).text('Loading next page...')
    error: ->
      $(this).button('There was an error, please try again')

