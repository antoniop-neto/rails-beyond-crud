class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    if @restaurant.save
    redirect_to @restaurant, notice: "Restaurant was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other, notice: "Restaurant was successfully deleted"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

end
