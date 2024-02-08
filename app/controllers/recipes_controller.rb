class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def public_recipes
    @recipes = Recipe.includes(:recipe_foods, recipe_foods: :food).where(public: true)
  end

  def modal
    @recipe = Recipe.find(params[:id])
    @inventories = Inventory.all
  end

  def shopping_list
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    @inventory = Inventory.includes(inventory_foods: :food).find(params[:inventory_id])
    @shop_list = []
    @recipe.recipe_foods.each do |rf|
      i_food = @inventory.inventory_foods.find_by(food: rf.food)
      if i_food.nil?
        quantity = rf.quantity
        shop_price = quantity * rf.food.price
      elsif i_food.quantity < rf.quantity
        quantity = rf.quantity - i_food.quantity
        shop_price = quantity * rf.food.price
      else
        quantity = 0
      end
      next unless quantity.positive?

      @shop_list << { name: rf.food.name, quantity:, measurement_unit: rf.food.measurement_unit, shop_price: }
    end
    @amount = @shop_list.count
    @total_price = @shop_list.sum { |item| item[:shop_price] }
  end
end
