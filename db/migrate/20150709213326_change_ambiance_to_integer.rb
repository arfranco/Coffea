class ChangeAmbianceToInteger < ActiveRecord::Migration
  def change
    change_column :establishments, :ambiance, 'integer USING CAST(ambiance AS integer)'
  end
end
