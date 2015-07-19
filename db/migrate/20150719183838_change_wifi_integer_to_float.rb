class ChangeWifiIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :establishments, :wifi, 'float USING CAST(coffee_quality AS float)'
  end
end
