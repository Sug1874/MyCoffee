class Item < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :tastes, dependent: :destroy
  has_many :areas, dependent: :destroy
  accepts_nested_attributes_for :tastes, allow_destroy: true
  accepts_nested_attributes_for :areas, allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :bitterness, presence:true, 
            numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :acidity, presence:true, 
            numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :body, presence:true, 
            numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :variety, length: { maximum: 50 }
  validates :process, length: { maximum: 50 }
  validates :farm, length: { maximum: 50 }
end
