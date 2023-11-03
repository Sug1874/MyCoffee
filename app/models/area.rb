class Area < ApplicationRecord
  belongs_to :item
  validates :area, presence: true, length: {maximum: 50}
end
