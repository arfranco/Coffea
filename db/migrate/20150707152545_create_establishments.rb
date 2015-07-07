class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :review_id
      t.string :wifi_quality
      t.string :coffee_quality
      t.string :service
      t.string :ambiance

      t.timestamps null: false
    end
  end
end
