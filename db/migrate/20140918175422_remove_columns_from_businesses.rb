class RemoveColumnsFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :text
    remove_column :businesses, :op_hours
  end
end
