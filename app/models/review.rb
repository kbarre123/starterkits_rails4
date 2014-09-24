class Review < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  validates :review, presence: true, length: { minimum: 5 }
  validates :rating, presence: true, numericality: { only_integer: true }

  # Like/dislike reviews
  acts_as_votable
  
end
