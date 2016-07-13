json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :address, :cnic
  json.url customer_url(customer, format: :json)
end
