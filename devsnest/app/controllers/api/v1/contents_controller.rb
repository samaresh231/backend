# frozen_string_literal: true

module Api
  module V1
    class ContentsController < ApplicationController
      include JSONAPI::ActsAsResourceController
      before_action :bot_authorization
    end
  end
end
