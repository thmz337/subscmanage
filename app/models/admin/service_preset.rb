class Admin::ServicePreset < ApplicationRecord
  enum :payment_unit, [ :month, :year ], validate: true

  validates :name, presence: true
  validates :payment_interval, comparison: { greater_than: 0 }
  validates :price, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
end
