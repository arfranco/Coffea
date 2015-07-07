class AddPrice < ActiveRecord::Migration
  def change
    add_column :establishments, :price, :integer
  end
end
