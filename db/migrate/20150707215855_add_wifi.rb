class AddWifi < ActiveRecord::Migration
  def change
    add_column :establishments, :wifi?, :boolean
  end
end
