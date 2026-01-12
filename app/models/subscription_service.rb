class SubscriptionService < ApplicationRecord
  belongs_to :user

  enum :payment_unit, [ :month, :year ], validate: true
  enum :monetary_unit, [ :JPY, :USD ], validate: true

  validates :name, presence: true
  validates :next_payment, comparison: { greater_than_or_equal_to: Date.today }
  validates :payment_interval, comparison: { greater_than: 0 }
  validates :price, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  scope :payment_for_that_day, ->(date) { where(next_payment: date) }
end
