class Business < ActiveRecord::Base
    belongs_to :category

    has_many :reviews, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :category_id, presence: true
    validates :street, presence: true
    validates :map_heading, presence: true
    validates :city, presence: true
    validates :zip_code, presence: true
    validates :state, presence: true
    validates :telephone, presence: true
    validates_associated :reviews

    geocoded_by :map_address
    after_validation :geocode

    # Sort index alphabetically by default
    default_scope { order('title ASC') }

    def map_address
      "#{self.street} #{self.city} #{self.state}, #{self.zip_code}"
    end

    def self.search(search)
      where("title LIKE ?", "%#{search}%")
    end

end
