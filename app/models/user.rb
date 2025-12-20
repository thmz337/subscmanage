class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscription_services, dependent: :destroy

  enum :role, [ :general, :admin ]

  def admin?
    role == "admin"
  end
end
