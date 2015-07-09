class AddWifiToEstablishments < ActiveRecord::Migration
  def change
    add_column :establishments, :wifi, :integer
  end
end
