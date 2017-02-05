class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :token
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
