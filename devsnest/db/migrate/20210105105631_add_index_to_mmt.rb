# frozen_string_literal: true

class AddIndexToMmt < ActiveRecord::Migration[6.0]
  def change
    add_index :mmts, :user_id, unique: true
    add_index :mmts, :mentor_id, unique: true
  end
end
