class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def top
    #create array of all restaurants
    #for each restaurant create array of all reviews
    #sum total ratings from reviews
    #divide sum by number of ratings to get average review
    # if average review is above a set threshold push into new array
    #call this array in top.html
    @reviews = Review.all
    @topRestaurants = []
    @reviews.each { |review| @topRestaurants << review.restaurant if review.rating == 5 }
    @topRestaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
