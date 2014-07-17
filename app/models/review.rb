class Review < ActiveRecord::Base
  belongs_to :business
  validates :reviewer, presence: true, length: { minimum: 5 }
  validates :review, presence: true, length: { minimum: 5 }
  validates :rating, numericality: { only_integer: true }
end
