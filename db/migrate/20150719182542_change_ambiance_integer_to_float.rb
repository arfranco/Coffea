class ChangeAmbianceIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :establishments, :ambiance, 'float USING CAST(coffee_quality AS float)'
  end
end
