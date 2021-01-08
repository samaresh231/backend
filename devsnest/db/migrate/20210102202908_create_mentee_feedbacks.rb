# frozen_string_literal: true

class CreateMenteeFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :mentee_feedbacks do |t|
      t.string :user_id
      t.integer :mentee_id
      t.text :feedback
      t.integer :efforts
      t.integer :understanding

      t.timestamps
    end
  end
end
