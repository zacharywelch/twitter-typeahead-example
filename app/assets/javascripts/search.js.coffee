$ ->
  search_users = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 2
    remote:
      url: '/search?q=%QUERY'
      filter: (data) ->
        data.users
      ajax:
        beforeSend: ->
          $('#search .spinner').toggleClass 'hidden'
          return
        complete: ->
          $('#search .spinner').toggleClass 'hidden'
          return
  )
  search_products = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 2
    remote:
      url: '/search?q=%QUERY'
      filter: (data) ->
        data.products
      ajax:
        beforeSend: ->
          # $('#search .spinner').toggleClass 'hidden'
          return
        complete: ->
          # $('#search .spinner').toggleClass 'hidden'
          return
  )
  
  search_users.initialize()
  search_products.initialize()

  $('#search .typeahead').typeahead null, {
    name: 'users'
    displayKey: 'name'
    source: search_users.ttAdapter()
    templates: 
      header: HandlebarsTemplates['accounts/header']
      suggestion: HandlebarsTemplates['accounts/show']
      footer: HandlebarsTemplates['accounts/footer']
  },
    name: 'products'
    displayKey: 'name'
    source: search_products.ttAdapter()
    templates: 
      header: HandlebarsTemplates['orders/header']
      suggestion: HandlebarsTemplates['orders/show']
      footer: HandlebarsTemplates['orders/footer']
