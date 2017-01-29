class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts, force: true do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, index: true
    end
  end
end
