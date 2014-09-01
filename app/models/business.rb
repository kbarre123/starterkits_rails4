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
    #validates :address, presence: true #Commented these out trying to debug; will want them validated though
    #validates :longitude, presence: true
    #validates :latitude, presence: true
    validates_associated :reviews

    geocoded_by :address
    after_validation :geocode
end
