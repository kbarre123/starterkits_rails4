class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true, touch: true
    belongs_to :user
    validates :text, presence: true
end
