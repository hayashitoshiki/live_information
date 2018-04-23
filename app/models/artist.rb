class Artist < ApplicationRecord
   validates :artist, {presence: true,uniqueness: true}
    validates :switch, {presence: true}
    default_scope -> { order(artist: :asc) }
end
