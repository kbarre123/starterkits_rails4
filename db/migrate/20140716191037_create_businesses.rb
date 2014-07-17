class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
