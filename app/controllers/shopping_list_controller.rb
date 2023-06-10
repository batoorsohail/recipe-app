class ShoppingListController < ApplicationController
  def index
    @foods = Food.includes(:user)
      .where('foods.quantity < (SELECT COALESCE(SUM(recipe_foods.quantity), 0)
        FROM recipe_foods WHERE recipe_foods.food_id = foods.id)')
      .where(user_id: current_user.id).references(:recipe_foods)

    @quantity_delta = Food.includes(:user)
      .joins('LEFT JOIN recipe_foods ON recipe_foods.food_id = foods.id')
      .group('foods.id')
      .sum('COALESCE(recipe_foods.quantity, 0) - foods.quantity')

    @prices = {}
    @ingredients = @foods.each do |ingredient|
      price_per_ingredient = if ingredient.quantity.zero?
                               ingredient.price
                             else
                               ingredient.price / ingredient.quantity
                             end
      price = @quantity_delta[ingredient.id] * price_per_ingredient
      @prices[ingredient.id] = price
      @prices[ingredient.id] = price
    end

    @total_price = @prices.values.sum
  end
end
