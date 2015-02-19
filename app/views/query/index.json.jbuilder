@groups.each do |name, values|
  json.set! name do 
    json.items values[:items] do |json, item|
      json.array! item
      json.url url_for :controller => name, :action => :show, :id => item[:id]
    end
    json.count values[:count]    
  end
end
