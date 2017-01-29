class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, force: true do |t|
      t.string :name
      t.string :surname
      t.string :email
    end
  end
end
