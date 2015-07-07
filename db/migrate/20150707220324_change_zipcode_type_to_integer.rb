class ChangeZipcodeTypeToInteger < ActiveRecord::Migration
  def change
    change_column :establishments, :zip_code, 'integer USING CAST(zip_code AS integer)'
  end
end
