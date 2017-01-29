class CreateUser < ActiveRecord::Migration
  def self.up
    create_table :users do |user|
      user.string   :name
    end
   
    User.create(name: "Tom")
    User.create(name: "Steve")
  end
  def self.down
    drop_table :users
  end
end
