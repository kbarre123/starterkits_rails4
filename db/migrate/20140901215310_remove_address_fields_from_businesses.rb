class RemoveAddressFieldsFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :street_no, :string
    remove_column :businesses, :country, :string
    add_column :businesses, :state, :string
  end
end
