class CreateGroupcalls < ActiveRecord::Migration[6.0]
  def change
    create_table :groupcalls do |t|
      t.integer :user_id
      t.integer :choice
      t.integer :week
      t.integer :year
      t.integer :group_id
      t.timestamps
    end
  end
end
