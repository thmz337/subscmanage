class AddMonetaryUnitToAdminServicePresets < ActiveRecord::Migration[8.1]
  def change
    add_column :admin_service_presets, :monetary_unit, :integer
  end
end
