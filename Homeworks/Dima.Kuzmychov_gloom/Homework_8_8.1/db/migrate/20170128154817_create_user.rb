class CreateUser < ActiveRecord::Migration
  def self.up
      create_table :users do |user|
      user.string   :name
      end
   
    User.create(name: "Dima")                
    User.create(name: "Petro")
               
  end
  def self.down
    
    drop_table :users
  end
end
