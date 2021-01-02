class User < ApplicationRecord
  belongs_to :mmt
  has_one :mentee_feedback
  has_one :mentor_feedback
  
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtBlacklist

  enum kind: [:normal, :admin]

end