class Establishment < ActiveRecord::Base
  has_many :reviews

  #pg_search_scope :quick_search, against: [:coffee_quality, :wifi, :price, :ambiance]

  scope :wifi, -> (wifi) { where "wifi >= ?", wifi }
  scope :price, -> (price) { where "price <= ?", price }
  scope :coffee_quality, -> (coffee_quality) { where "coffee_quality >= ?", coffee_quality }
  scope :ambiance, -> (ambiance) { where "ambiance >= ?", ambiance }
end
