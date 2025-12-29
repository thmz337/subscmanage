class DropServicePreset < ActiveRecord::Migration[8.1]
  def change
    drop_table :service_presets
  end
end
