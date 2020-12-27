module Api
    module V1
      class MentorFeedResource < JSONAPI::Resource
        attributes :user_id, :mentor_id, :feedback, :timeGiven, :capability
  
      end
    end
  end
  