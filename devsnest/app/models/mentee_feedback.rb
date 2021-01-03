# frozen_string_literal: true

class MenteeFeedback < ApplicationRecord
  belongs_to :user

  enum effort: %i[green yellow red], _suffix: true
  enum understanding: %i[green yellow red], _prefix: :comments
end
