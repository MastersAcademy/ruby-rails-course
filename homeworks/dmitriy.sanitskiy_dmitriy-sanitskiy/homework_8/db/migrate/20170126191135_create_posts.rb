class CreatePosts < ActiveRecord::Migration[5.0]
  def self.up
    create_table :posts do |t|
      t.string     :title
      t.text       :body
      t.belongs_to :user, index: true
      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
  def self.down
    drop_table :posts
  end
end
