# frozen_string_literal: true

module Api
  module V1
    class MmtsController < ApplicationController
      include JSONAPI::ActsAsResourceController
      before_action :authenticate_user!
      before_action :authorize, only: %i[update delete create]

      def context
        { user: current_user }
      end

      def authorized
        return head 403 if current_user.normal?
      end
    end
  end
end
