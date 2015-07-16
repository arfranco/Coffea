class Review < ActiveRecord::Base
  belongs_to :establishment
  belongs_to :user

  validates :user_id, presence: true
  validates :establishment_id, presence: true

  #pg_search_scope :quick_search, against: [:coffee_quality, :wifi, :price, :ambiance]

end
