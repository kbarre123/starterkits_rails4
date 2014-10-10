class Comment < ActiveRecord::Base
    belongs_to :post, touch: true
    belongs_to :user
    validates :text, presence: true
end
