# frozen_string_literal: true

module Api
  module V1
    class UserResource < JSONAPI::Resource
<<<<<<< HEAD
      attributes :email, :name, :kind, :bio, :image_url
=======
      attributes :email, :name, :kind, :bio, :image_url, :password

>>>>>>> cb32c5a9e034ec8e8f09d06a053a406130c513ad
      def self.updatable_fields(context)
        if context[:user].normal?
          super - [:kind]
        else
          super
        end
      end

      def self.creatable_fields(context)
        if context[:user].normal?
          super - [:kind]
        else
          super
        end
      end

      def fetchable_fields
        super - [:password]
      end
    end
  end
end
