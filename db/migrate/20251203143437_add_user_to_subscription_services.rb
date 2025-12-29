class AddUserToSubscriptionServices < ActiveRecord::Migration[8.1]
  def change
    add_reference :subscription_services, :user, null: false, foreign_key: true
  end
end
