class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :body
      t.integer :rating
      t.references :business, index: true

      t.timestamps
    end
  end
end
