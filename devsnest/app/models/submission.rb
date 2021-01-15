# frozen_string_literal: true

class Submission < ApplicationRecord
  enum status: %i[done notdone doubt]
end
