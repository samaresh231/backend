class MentorFeed < ApplicationRecord
    enum timeGiven: [:green, :yellow, :red]
    enum capability: [:green, :yellow, :red]
end
