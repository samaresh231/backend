# frozen_string_literal: true

class User < ApplicationRecord
  has_one :mmt
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtBlacklist

  enum kind: %i[normal admin]
end
