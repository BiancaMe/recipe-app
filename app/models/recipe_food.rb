class RecipeFood < ApplicationRecord
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :food, class_name: 'Food'
  belongs_to :recipe, class_name: 'Recipe'
end
