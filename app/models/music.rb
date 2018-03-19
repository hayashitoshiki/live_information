class Music < ApplicationRecord
  validates :music, {presence: true,uniqueness: true}
end
