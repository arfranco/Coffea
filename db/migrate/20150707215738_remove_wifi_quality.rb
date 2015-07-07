class RemoveWifiQuality < ActiveRecord::Migration
  def change
    remove_column(:establishments, :wifi_quality)
  end
end
