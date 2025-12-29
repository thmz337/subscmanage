class CreateSubscServices < ActiveRecord::Migration[8.1]
  def change
    create_table :subsc_services do |t|
      t.string :name
      t.date :last_payment
      t.integer :payment_interval
      t.string :payment_unit
      t.integer :price

      t.timestamps
    end
  end
end
