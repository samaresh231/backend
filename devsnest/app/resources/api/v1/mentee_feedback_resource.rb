# frozen_string_literal: true

module Api
  module V1
    class MenteeFeedbackResource < JSONAPI::Resource
      attributes :user_id, :mentee_id, :feedback, :effort, :understanding
    end
  end
end
