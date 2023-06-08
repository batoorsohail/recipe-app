class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new 
    @food = Food.new
  end

  def create
    @food = current_user.foods.create(food_params)
    if @food.save
      redirect_to foods_path notice: "Food successfully created."
    else
      render :new, notice: 'Comment failed to be created.'
    end
  end
  
  private 
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
