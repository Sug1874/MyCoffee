class Roast < ApplicationRecord
  validates :roast_level, presence: true, length: { maximum: 50 }
end
