class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, force: true do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, index: true
    end
  end
end
