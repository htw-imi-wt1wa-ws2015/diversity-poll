json.array!(@dimensions) do |dimension|
  json.extract! dimension, :id, :name, :description
  json.url dimension_url(dimension, format: :json)
end
