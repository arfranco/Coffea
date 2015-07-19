class ChangePriceIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :establishments, :price, 'float USING CAST(coffee_quality AS float)'
  end
end
