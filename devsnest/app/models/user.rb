# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtBlacklist

  enum kind: [:normal, :admin]
  has_many :gbu
end
