class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[public_recipes show]
  before_action :set_ability

  def set_ability
    @ability = Ability.new(current_user)
  end

  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    @inventories = Inventory.all
  end

  def new
    @recipe = Recipe.new
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end

  def update_privacy
    @recipe = Recipe.find(params[:id])
    @recipe.toggle!(:public)
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe privacy updated.'
    else
      render 'edit'
    end
  end

  def public_recipes
    @recipes = Recipe.includes(:recipe_foods, recipe_foods: :food).where(public: true)
  end

  def shopping_list
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    if params[:inventory_id] == '--Select Inventory--'
      redirect_to recipe_path(@recipe), alert: 'Please add an inventory'
    else
      @inventory = Inventory.includes(inventory_foods: :food).find(params[:inventory_id])
      @shop_list = []
      @shop_list = calculate_shopping_list(@recipe, @inventory)
    end
  end

  def calculate_shopping_list(recipe, inventory)
    shop_list = []
    recipe.recipe_foods.each do |rf|
      i_food = inventory.inventory_foods.find_by(food: rf.food)
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

      shop_list << { name: rf.food.name, quantity: quantity, measurement_unit: rf.food.measurement_unit, shop_price: shop_price }
    end
    shop_list
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
