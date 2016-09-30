$ ->
  engine = new Bloodhound(
    limit: 10
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: '/characters/search?q=%QUERY'
  )
  engine.initialize()  
  $('#search .typeahead').typeahead null, {
    displayKey: 'name'
    source: engine.ttAdapter()
    templates: 
      suggestion: HandlebarsTemplates['search']
  }