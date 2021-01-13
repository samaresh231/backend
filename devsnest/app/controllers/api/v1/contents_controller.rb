# frozen_string_literal: true

module Api
    module V1
      class ContentsController < ApplicationController
        include JSONAPI::ActsAsResourceController
        #before_action :authenticate_user!

        def context
            { user: current_user }
        end

        def curriculam
          @headings = Content.find_by(content_name: "Algo")
          render json: {curriculam: @headings}

        end

      end
    end
  end
  