module Api
    module V1
      class MenteeFeedResource < JSONAPI::Resource
        attributes :user_id, :mentee_id, :feedback, :efforts, :understanding
  
      end
    end
  end
  