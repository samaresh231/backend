# frozen_string_literal: true

module Api
  module V1
    class MentorFeedbackResource < JSONAPI::Resource
      attributes :user_id, :mentor_id, :feedback, :timeGiven, :capability
    end
  end
end
