class ChangeCoffeQualityToInteger < ActiveRecord::Migration
  def change
    change_column :establishments, :coffee_quality, 'integer USING CAST(coffee_quality AS integer)'
  end
end
