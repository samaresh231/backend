# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include JSONAPI::ActsAsResourceController

      def report
        discord_id = params[:discord_id]
        user = User.find_by(discord_id: discord_id)
        return render_error('User not found') if user.nil?

        days = params[:days].to_i || nil

        res = Submission.user_report(days, user.id)
        render json: res
      end

      def leaderboard
        scoreboard = User.order(score: :desc)
        render json: scoreboard
      end
    end
  end
end
