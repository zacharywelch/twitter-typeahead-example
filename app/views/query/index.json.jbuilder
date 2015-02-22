@groups.each do |name, values|
  json.set! name do 
    json.items values[:items] do |item|
      json.array! item.instance_values.merge(
        url: url_for(:controller => name, :action => :show, :id => item.id)
      )
    end
    json.count values[:count]    
  end
end
