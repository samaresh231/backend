module Api
  module V1
    class UsersController < ApplicationController
      include JSONAPI::ActsAsResourceController
      before_action :authenticate_user!
      before_action :authorize_member, only: [:update, :delete]
      before_action :authorize_collection, only: [:create]

      def context
        { user: current_user }
      end

      def authorize_collection
        return render_forbidden if current_user.normal?
      end

      def authorize_member
        return render_forbidden unless current_user.id == params[:id].to_i || current_user.admin?
      end
    end
  end
end
