class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build()
    @recipe.ingredients.build()
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe
    else
      redirect_to new_recipe_path
    end

  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
      ingredients_attributes: [
        :id,
        :name,
        :quantity
        ])
  end
end
