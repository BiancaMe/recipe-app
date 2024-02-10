class FoodsController < ApplicationController
  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to root_path, notice: 'Food successfully added'
    else
      render :new, notice: 'Failed'
    end
  end

  def new; end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    # redirect_to foods_path, notice: 'Food deleted successfully'
  end

  private

  def food_params
    params.permit(:name, :measurement_unit, :price)
  end
end
