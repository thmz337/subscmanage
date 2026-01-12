class AddMonetaryUnitToSubscriptionServices < ActiveRecord::Migration[8.1]
  def change
    add_column :subscription_services, :monetary_unit, :integer
  end
end
