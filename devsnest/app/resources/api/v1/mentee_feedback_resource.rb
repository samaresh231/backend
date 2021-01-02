module Api
  module V1
    class MenteeFeedbackResource < JSONAPI::Resource
      attributes :user_id, :mentee_id, :feedback, :efforts, :understanding
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