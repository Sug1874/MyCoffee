class Taste < ApplicationRecord
  belongs_to :item
  validates :taste, presence: true, length: { maximum: 50 }
end
