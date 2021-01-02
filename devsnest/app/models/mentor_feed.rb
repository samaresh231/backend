class MentorFeed < ApplicationRecord
    enum timeGiven: [:green, :yellow, :red], _suffix: true
    enum capability: [:green, :yellow, :red], _prefix: :comments
end
