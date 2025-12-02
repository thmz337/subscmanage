class ChangeSubscServicesToSubscriptionServices < ActiveRecord::Migration[8.1]
  def change
    rename_table :subsc_services, :subscription_services
  end
end
