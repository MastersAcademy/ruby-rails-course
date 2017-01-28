 class CreateUsers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :users, force: true do |t|
      t.string   :name
      t.string   :email
      t.integer  :age

      t.timestamps
    end
  end
  def self.down
    drop_table :users
  end
end
