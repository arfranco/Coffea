class AddEstablishmentId < ActiveRecord::Migration
  def change
    add_column :reviews, :establishment_id, :integer
  end
end
