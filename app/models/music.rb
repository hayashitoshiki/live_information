class Music < ApplicationRecord
  validates :title, {presence: true,uniqueness: true}
end
