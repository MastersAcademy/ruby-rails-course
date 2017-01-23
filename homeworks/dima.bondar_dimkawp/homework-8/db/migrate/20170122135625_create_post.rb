class CreatePost < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
  def down
    drop_table :posts
  end
end
