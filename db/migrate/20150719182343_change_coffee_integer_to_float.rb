class ChangeCoffeeIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :establishments, :coffee_quality, 'float USING CAST(coffee_quality AS float)'
  end
end
