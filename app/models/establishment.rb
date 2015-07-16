class Establishment < ActiveRecord::Base
  has_many :reviews

  scope :wifi, -> (wifi) { where "wifi >= ?", wifi }
  scope :price, -> (price) { where "price <= ?", price }
  scope :coffee_quality, -> (coffee_quality) { where "coffee_quality >= ?", coffee_quality }
  scope :ambiance, -> (ambiance) { where "ambiance >= ?", ambiance }
end
