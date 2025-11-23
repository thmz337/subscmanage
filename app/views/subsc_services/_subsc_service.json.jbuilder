json.extract! subsc_service, :id, :name, :next_payment, :payment_interval, :payment_unit, :price, :created_at, :updated_at
json.url subsc_service_url(subsc_service, format: :json)
