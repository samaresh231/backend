# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtBlacklist

<<<<<<< HEAD
  enum kind: [:normal, :admin]
  has_many :gbu
end
=======
  enum kind: { normal: 0, admin: 1 }
end
>>>>>>> cb32c5a9e034ec8e8f09d06a053a406130c513ad
