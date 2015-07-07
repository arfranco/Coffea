class AddFlaggedColumn < ActiveRecord::Migration
  def change
    add_column :reviews, :flagged, :boolean
  end
end
