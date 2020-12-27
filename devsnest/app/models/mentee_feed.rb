class MenteeFeed < ApplicationRecord
    enum efforts: [:green, :yellow, :red]
    enum understanding: [:green, :yellow, :red]
end
