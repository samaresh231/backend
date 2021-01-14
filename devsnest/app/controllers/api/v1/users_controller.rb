# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include JSONAPI::ActsAsResourceController
      # before_action :authenticate_user!
      # before_action :authorize_member, only: %i[update delete]
      # before_action :authorize_collection, only: [:create]

      def context
        { user: current_user }
      end

      def authorize_collection
        return head 403 if current_user.normal?
      end

      def authorize_member
        return head 403 unless current_user.id == params[:id].to_i || current_user.admin?
      end
    end
  end
end
