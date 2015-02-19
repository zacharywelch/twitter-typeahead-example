$ ->
  search_users = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 2
    remote:
      url: '/search?q=%QUERY'
      filter: (data) ->
        data.users
  )
  search_products = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 2
    remote:
      url: '/search?q=%QUERY'
      filter: (data) ->
        data.products
  )
  search_users.initialize()
  search_products.initialize()

  $('#search .typeahead').typeahead null, {
    name: 'users'
    displayKey: 'name'
    source: search_users.ttAdapter()
    templates: 
      header: "
        <div class='media pad1'>
          <div class='media-left pad1r'>
            <i class='icon icon-folder-open fill-purple dark pad1 round'></i>
          </div>
          <div class='media-body'>
            <h4>Accounts</h4>
            <small class='strong quiet'>6 results</small>
          </div>
        </div>"
      suggestion: Handlebars.compile("
        <div class='pad1 keyline-top contain'>
          <div class='pad0x'>
            <span class='small quiet pull-right'>AT-123456789</span>
            <h4>Squarespace</h4>
            <ul class='small quiet'>
              <li>bsmith@squarespace.com</li>
              <li>Lovetta Patterson</li>
            </ul>
          </div>
        </div>")
      footer: "
        <div class='pad1 keyline-top keyline-bottom clearfix'>
          <a href='#fakelink' class='pad0x small quiet pull-right'>More orders (1)<i class='icon icon-play icon-sm'></i></a>
        </div>                
      "
  },
    name: 'products'
    displayKey: 'name'
    source: search_products.ttAdapter()
    templates: 
      header: "
        <div class='media pad1'>
          <div class='media-left pad1r'>
            <i class='icon icon-briefcase fill-orange dark pad1 round'></i>
          </div>
          <div class='media-body'>
            <h4>Orders</h4>
            <small class='strong quiet'>4 results</small>
          </div>
        </div>"
      suggestion: Handlebars.compile("
        <div class='pad1 keyline-top contain clearfix'>
          <div class='pad0x'>
            <h4>CT-3103445</h4>
            <ul class='small quiet'>
              <li class='pull-left'>
                Robert Half International
              </li>
              <li class='pull-right'>
                $50,000
              </li>
              <li class='pull-left'>
                Lovetta Patterson
              </li>
              <li class='pull-right'>
                Jan 2014
              </li>                      
            </ul>
          </div>
        </div>
      ")
      footer: "
        <div class='pad1 keyline-top keyline-bottom clearfix'>
          <a href='#fakelink' class='pad0x small quiet pull-right'>More orders (1)<i class='icon icon-play icon-sm'></i></a>
        </div>                
      "

