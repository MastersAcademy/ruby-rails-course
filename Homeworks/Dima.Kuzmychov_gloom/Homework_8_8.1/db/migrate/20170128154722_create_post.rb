class CreatePost < ActiveRecord::Migration
  def self.up
    # создание таблицы с заданными полями
    create_table :posts do |post|
      post.string   :title
      post.text     :content
      post.timestamps
      post.belongs_to :user, index: true
    end
    # тестовые записи
    Post.create(title: "Example Post",
                content: "Content of my first post",
                user_id: 1)
    Post.create(title: "Second Post",
                content: "Content of my second post",
                user_id: 2)
  end
  def self.down
    # откатить миграцию (rake:db rollback)
    drop_table :posts
  end
end
