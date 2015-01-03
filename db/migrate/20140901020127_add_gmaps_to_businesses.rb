class AddGmapsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :address, :string
    add_column :businesses, :longitude, :float
    add_column :businesses, :latitude, :float
    add_column :businesses, :gmaps, :boolean
  end
end
