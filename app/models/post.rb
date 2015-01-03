class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, :as => :commentable, dependent: :destroy
    validates :text, presence: true
end
