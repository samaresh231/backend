# frozen_string_literal: true

module Api
  module V1
    class UserResource < JSONAPI::Resource
      attributes :email, :name, :password, :discord_id, :active, :role, :username, :buddy
      def fetchable_fields
        super - [:password]
      end
    end
  end
end
