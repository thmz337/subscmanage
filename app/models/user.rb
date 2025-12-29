class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscription_services, dependent: :destroy

  enum :role, [ :general, :admin ]

  def admin?
    role == "admin"
  end

  def this_month_payment_services
    start_date = Date.today.beginning_of_month
    end_date = start_date.end_of_month
    subscription_services.where(next_payment: start_date..end_date)
  end
end
