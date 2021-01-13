module Api
  module V1
    class ContentResource < JSONAPI::Resource
      attributes :unique_id, :parent_id,:content_name, :content_type, :content_article_link, :content_video_link, :question_link,  :extra_question
    end
  end
end