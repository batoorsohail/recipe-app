class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @recipes = Recipe.find(params[:id])
  end
end
