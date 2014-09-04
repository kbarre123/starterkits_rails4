class Business < ActiveRecord::Base

    has_many :reviews, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :category, presence: true
    validates :street, presence: true
    validates :map_heading, presence: true
    validates :city, presence: true
    validates :zip_code, presence: true
    validates :state, presence: true
    validates :telephone, presence: true
    validates_associated :reviews

    geocoded_by :gmaps4rails_address
    after_validation :geocode

    def gmaps4rails_address
      "#{self.street}, #{self.city}, #{self.state}, #{self.zip_code}"
    end
end
