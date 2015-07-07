class RemoveReviewId < ActiveRecord::Migration
  def change
    remove_column(:establishments, :review_id)
  end
end
