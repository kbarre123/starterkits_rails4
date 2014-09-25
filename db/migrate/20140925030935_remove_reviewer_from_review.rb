class RemoveReviewerFromReview < ActiveRecord::Migration
  def change
    remove_column :reviews, :reviewer
  end
end
