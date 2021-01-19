# frozen_string_literal: true

class Content < ApplicationRecord
  enum data_type: %i[question video article topic subtopic]
  has_many :submission
end
