module Api
    module V1
      class MentorFeedResource < JSONAPI::Resource
        attributes :user_id, :mentor_id, :feedback, :timeGiven, :capability
        def self.updatable_fields(context)
          if context[:user].normal?
            super 
          end
        end
  
        def fetchable_fields
          if context[:user].present?
            super 
          end
        end
  
      end
    end
  end
  