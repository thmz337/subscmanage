class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscription_services, dependent: :destroy

  enum :role, [ :general, :admin ]

  def admin?
    role == "admin"
  end

  def this_month_payment_services
    subscription_services.filter { |service| service.next_payment.month == Date.today.month }
  end
end
