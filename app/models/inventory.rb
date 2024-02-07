class Inventory < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true

  belongs_to :user
  has_many :inventory_foods, foreign_key: :inventory_id, dependent: :destroy
end
