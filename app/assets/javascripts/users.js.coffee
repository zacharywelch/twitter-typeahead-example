$ ->
  users = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: '/users?q=%QUERY')
  users.initialize()
  $('#users.typeahead').typeahead null,
    displayKey: 'name'
    source: users.ttAdapter()
    templates:
      suggestion: Handlebars.compile("<strong>{{name}}</strong> <small class='quiet inline'>({{id}})</small>")