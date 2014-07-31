class Business < ActiveRecord::Base
    has_many :reviews, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates_associated :reviews
end
