class ChangeColBodyToReviewInReviewTable < ActiveRecord::Migration
    def change
        rename_column :reviews, :body, :review
    end
end
