class AddMapHeadingToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :map_heading, :string
  end
end
