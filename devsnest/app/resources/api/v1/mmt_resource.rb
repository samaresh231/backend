# frozen_string_literal: true

module Api
  module V1
    class MmtResource < JSONAPI::Resource
      attributes :user_id, :mentor_id
    end
  end
end
