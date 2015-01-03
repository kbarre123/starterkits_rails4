class AddAttributesToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :street_no, :string
    add_column :businesses, :street, :string
    add_column :businesses, :city, :string
    add_column :businesses, :zip_code, :string
    add_column :businesses, :country, :string
    add_column :businesses, :telephone, :string
    add_column :businesses, :website, :string
    add_column :businesses, :op_hours, :string
    add_column :businesses, :category, :string
  end
end
