class CreateExchanges < ActiveRecord::Migration[8.1]
  def change
    create_table :exchanges do |t|
      t.integer :base_currency
      t.date :base_date
      t.json :data

      t.timestamps
    end
  end
end
