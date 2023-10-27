class Taste < ApplicationRecord
  belongs_to :item
  validates :item_id, presence: true
  validates :taste, presence: true, length: {maximum: 50}
end
