# frozen_string_literal: true

module Api
  module V1
    class SubmissionsController < ApplicationController
      include JSONAPI::ActsAsResourceController

      def create
        discord_id = params['data']['attributes']['discord_id']
        question_unique_id = params['data']['attributes']['question_unique_id']
        user = User.find_by(discord_id: discord_id)
        content = Content.find_by(unique_id: question_unique_id)

        return render_error('User or Content not found') if user.nil? || content.nil?

        submission = Submission.find_or_create_by(user_id: user.id, content_id: content.id)
        submission.status = params['data']['attributes']['status']
        submission.save

        render_success(submission.as_json.merge("type": 'submission'))
      end
    end
  end
end
