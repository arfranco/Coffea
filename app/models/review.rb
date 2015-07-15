class Review < ActiveRecord::Base
  belongs_to :establishment
  belongs_to :user

  validates :user_id, presence: true
  validates :establishment_id, presence: true

end
