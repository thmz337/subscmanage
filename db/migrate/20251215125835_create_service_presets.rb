class CreateServicePresets < ActiveRecord::Migration[8.1]
  def change
    create_table :service_presets do |t|
      t.string :name
      t.integer :payment_interval
      t.integer :payment_unit
      t.integer :price

      t.timestamps
    end
  end
end
