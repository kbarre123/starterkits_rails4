class AddCommentsTable < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  	  t.text :text
  	  t.belongs_to :commentable, polymorphic: true
  	  t.references :user, index: true
  	  t.timestamps
  	end

  	add_index :comments, [:commentable_id, :commentable_type]
  end
end
