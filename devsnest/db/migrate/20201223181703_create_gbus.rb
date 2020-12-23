class CreateGbus < ActiveRecord::Migration[6.0]
  def change
    create_table :gbus do |t|
      t.text :gbu
      t.belongs_to :user, :foreign_key => true
      t.timestamps
    end
    add_index :gbus, [:created_at]
  end
end
