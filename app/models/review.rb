class Review < ActiveRecord::Base
  belongs_to :establishment
  belongs_to :user
end
