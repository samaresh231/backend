# frozen_string_literal: true

module Api
  module V1
    class MmtResource < JSONAPI::Resource
      attributes :user_id, :mentor_id
      attributes :user_discord_id, :mentors_discord_id

      def user_discord_id
        user = User.find_by(id: @model.user_id)
        user.nil? ? '' : user.discord_id
      end

      def mentors_discord_id
        user = User.find_by(id: @model.mentor_id)
        user.nil? ? '' : user.discord_id
      end
    end
  end
end
