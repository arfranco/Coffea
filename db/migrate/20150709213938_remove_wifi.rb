class RemoveWifi < ActiveRecord::Migration
  def change
    remove_column(:establishments, :wifi?)
  end
end
