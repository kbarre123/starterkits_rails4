class Business < ActiveRecord::Base
    has_many :reviews, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :category, presence: true
    validates :street_no, presence: true
    validates :street, presence: true
    validates :city, presence: true
    validates :zip_code, presence: true
    validates :country, presence: true
    validates :telephone, presence: true
    validates_associated :reviews

    #geocoded_by :gmaps4rails_address
    #after_validation :geocode

    #private

    #def gmaps4rails_address
    #  "#{street_no}, #{street}, #{city}, #{zip_code}, #{country}"
    #end
end
