class Establishment < ActiveRecord::Base
  has_many :reviews

  pg_search_scope :quick_search, against: [:coffee_quality, :wifi, :price, :ambiance]
end
