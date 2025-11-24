class SubscService < ApplicationRecord
  validates :name, presence: true
  validates :next_payment, presence: true, comparison: { greater_than_or_equal_to: Date.today }
  validates :payment_interval, presence: true, comparison: { greater_than: 0 }
  validates :payment_unit, presence: true,
  inclusion: { in: ->(service) {
    service.available_payment_units
  } }
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0 }

  def available_payment_units
    %w[month year]
  end
end
