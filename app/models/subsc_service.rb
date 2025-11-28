class SubscService < ApplicationRecord
  validates :name, presence: true
  validates :next_payment, comparison: { greater_than_or_equal_to: Date.today }
  validates :payment_interval, comparison: { greater_than: 0 }
  validates :payment_unit, presence: true,
  inclusion: { in: ->(service) {
    service.available_payment_units
  } }
  validates :price, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def available_payment_units
    %w[month year]
  end
end
