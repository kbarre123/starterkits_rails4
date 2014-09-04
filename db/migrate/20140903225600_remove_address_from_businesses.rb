class RemoveAddressFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :address 
  end
end
