class Music < ApplicationRecord
  validates :title, {presence: true,uniqueness: true}
  default_scope -> { order(artist: :asc) }
  default_scope -> { order(title: :asc) }
end
