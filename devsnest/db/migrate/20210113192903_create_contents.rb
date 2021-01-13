class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
    	t.string :unique_id
    	t.string :parent_id
    	t.string :content_name
    	t.integer :content_type
    	t.string :content_article_link
    	t.string :content_video_link
        t.string :question_link
        t.boolean :extra_question


      t.timestamps
    end
  end
end
