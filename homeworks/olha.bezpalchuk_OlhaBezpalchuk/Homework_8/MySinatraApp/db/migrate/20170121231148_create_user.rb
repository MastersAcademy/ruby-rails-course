class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users, force: true do |t|
      t.string :name
    end
  end
end
