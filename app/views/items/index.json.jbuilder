json.array!(@items) do |item|
  json.extract! item, :id, :item_name, :item_type
  json.url item_url(item, format: :json)
end
