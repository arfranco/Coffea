class Review < ActiveRecord::Base
  include PgSearch
  belongs_to :establishment
  belongs_to :user

  validates :user_id, presence: true
  validates :establishment_id, presence: true

  pg_search_scope :quick_search, against: [:content]

end
