json.array!(@characters) do |character|
  json.extract! character, :name, :show
  json.image_url image_url(character.image_url) 
  json.url character_url(character, format: :json)
end
