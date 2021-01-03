# frozen_string_literal: true

module Api
  module V1
    class MenteeFeedbacksController < ApplicationController
      include JSONAPI::ActsAsResourceController
      before_action :authenticate_user!
      before_action :authorize_member, only: %i[update delete]

      def context
        { user: current_user }
      end

      def authorize_member
        return head 403 unless current_user.id == params[:id].to_i # we dont need admin to update fields
      end
    end
  end
end
