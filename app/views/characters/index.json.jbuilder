json.array!(@characters) do |character|
  json.extract! character, :id, :name, :image_url, :show
  json.url character_url(character, format: :json)
end
