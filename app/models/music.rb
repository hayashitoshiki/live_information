class Music < ApplicationRecord
  validates :title, {presence: true,uniqueness: true}
   default_scope -> { order(title: :desc) }
end
