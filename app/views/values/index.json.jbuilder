json.array!(@values) do |value|
  json.extract! value, :id, :label, :dimension_id
  json.url value_url(value, format: :json)
end
