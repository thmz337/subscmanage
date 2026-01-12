class Exchange < ApplicationRecord
  SUPPORTED_CURRENCIES = [ :JPY, :USD ]

  scope :latest_exchange, ->(currency) { where(base_currency: currency).order(created_at: :desc).first }
end
