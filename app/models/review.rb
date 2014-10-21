class Review < ActiveRecord::Base
  belongs_to :business, touch: true
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  validates :review, presence: true, length: { minimum: 5 }
  validates :rating, presence: true, numericality: { only_integer: true }

  # Like/dislike reviews
  #acts_as_votable
  
end
