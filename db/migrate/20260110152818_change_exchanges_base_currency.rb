class ChangeExchangesBaseCurrency < ActiveRecord::Migration[8.1]
  def change
    reversible do |direction|
      change_table :exchanges do |t|
        direction.up do
          t.change :base_currency, :string
        end
        direction.down do
          t.change :base_currency, :integer
        end
      end
    end
  end
end
