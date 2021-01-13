class CreateWriteups < ActiveRecord::Migration[6.0]
  def change
    create_table :writeups do |t|
      t.integer :user_id
      t.text :description
      t.integer :week
      t.timestamps
    end
  end
end
