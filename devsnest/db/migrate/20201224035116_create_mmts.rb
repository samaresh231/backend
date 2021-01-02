class CreateMmts < ActiveRecord::Migration[6.0]
  def change
    create_table :mmts do |t|
      t.integer :user_id
      t.integer :mentor_id
      #t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
