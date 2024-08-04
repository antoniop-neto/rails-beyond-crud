class ReviewsController < ApplicationController
  before_action :set_params, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to @restaurant, notice: 'Your review was successfully posted'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other, notice: 'Your review was successfully deleted'
  end

  private

  def set_params
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
