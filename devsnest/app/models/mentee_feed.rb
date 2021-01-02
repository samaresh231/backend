class MenteeFeed < ApplicationRecord
	belongs_to :user
    enum efforts: [:green, :yellow, :red], _suffix: true
    enum understanding: [:green, :yellow, :red], _prefix: :comments
end
