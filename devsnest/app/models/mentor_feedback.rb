# frozen_string_literal: true

class MentorFeedback < ApplicationRecord
  belongs_to :user

  enum timeGiven: %i[green yellow red], _suffix: true
  enum capability: %i[green yellow red], _prefix: :comments
end
