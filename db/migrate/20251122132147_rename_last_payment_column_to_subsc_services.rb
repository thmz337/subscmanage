class RenameLastPaymentColumnToSubscServices < ActiveRecord::Migration[8.1]
  def change
    rename_column :subsc_services, :last_payment, :next_payment
  end
end
