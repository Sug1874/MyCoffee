class Area < ApplicationRecord
  belongs_to :item
  validates :item_id, presence: true
  validates :area, presence: true, length: {maximum: 50}
end
