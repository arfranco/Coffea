class RemoveServiceColumn < ActiveRecord::Migration
  def change
    remove_column(:establishments, :service)
  end
end
