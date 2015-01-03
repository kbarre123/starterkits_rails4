class RemoveGmaps4railsFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :gmaps
  end
end
