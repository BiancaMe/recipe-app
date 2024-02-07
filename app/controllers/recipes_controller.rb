class RecipesController < ApplicationController
    def public_recipes
    @recipes = Recipe.all.where(public: true)
   end
end
