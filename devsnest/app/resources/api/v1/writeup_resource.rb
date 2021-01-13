# frozen_string_literal: true

module Api
    module V1
      class WriteupResource < JSONAPI::Resource
        attributes :user_id, :description, :week
    end
  end
end
