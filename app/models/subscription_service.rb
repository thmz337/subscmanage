class SubscriptionService < ApplicationRecord
  belongs_to :user

  enum :payment_unit, [ :month, :year ]

  validates :name, presence: true
  validates :next_payment, comparison: { greater_than_or_equal_to: Date.today }
  validates :payment_interval, comparison: { greater_than: 0 }
  validates :payment_unit, presence: true, numericality: { in: 0..1 }
  validates :price, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
end
