class ChangeSubscriptionServicesPaymentUnit < ActiveRecord::Migration[8.1]
  def change
    reversible do |direction|
      change_table :subscription_services do |t|
        direction.up do
          t.change :payment_unit, :integer, using: "payment_unit::integer"
        end
        direction.down do
          t.change :payment_unit, :string, using: "payment_unit::string"
        end
      end
    end
  end
end
