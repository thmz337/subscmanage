json.extract! subscription_service, :id, :name, :next_payment, :payment_interval, :payment_unit, :price, :created_at, :updated_at
json.url subscription_service_url(subscription_service, format: :json)
