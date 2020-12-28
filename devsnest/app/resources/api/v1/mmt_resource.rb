module Api
    module V1
      class MmtResource < JSONAPI::Resource
        attributes :user_id, :mentor_id
        def self.updatable_fields(context)
          if context[:user].normal?
            super 
          end
        end
  
        def self.creatable_fields(context)
          if context[:user].normal?
            super 
        end
      end
    end
  end
  