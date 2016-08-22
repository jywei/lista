class RestaurantsController < ApplicationController
  before_action :admin?, only: [:edit, :update, :destroy,]
  before_action :set_user, only: [:index, :create, :update, :destroy]
  before_action :set_the_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /restaurants
  # GET /restaurants.json
  def index
    # @restaurants = Restaurant.all
    # @fast_food_restaurants = Restaurant.where(category_id: 1)
    # @fast_food_search = Category.find(1)
    # @seafood_restaurants = Restaurant.where(category_id: 2)
    # @seafood_search = Category.find(2)
    # @steak_house_restaurants = Restaurant.where(category_id: 3)
    # @steak_house_search = Category.find(3)
    # @chinese_restaurants = Restaurant.where(category_id: 4)
    # @chinese_search = Category.find(4)
    # @family_restaurants = Restaurant.where(category_id: 5)
    # @family_search = Category.find(5)
    # @coffee_restaurants = Restaurant.where(category_id: 6)
    # @coffee_search = Category.find(6)

    if current_user

      @vlat = @user.latitude
      @vlon = @user.longitude

      visitor_latitude = @user.latitude
      visitor_longitude = @user.longitude

      @restaurants = Restaurant.near([visitor_latitude, visitor_longitude], 200)
      @fast_food_restaurants = Restaurant.where(category_id: 1).near([visitor_latitude, visitor_longitude], 200)
      @fast_food_search = Category.find(1)
      @seafood_restaurants = Restaurant.where(category_id: 2).near([visitor_latitude, visitor_longitude], 200)
      @seafood_search = Category.find(2)
      @steak_house_restaurants = Restaurant.where(category_id: 3).near([visitor_latitude, visitor_longitude], 200)
      @steak_house_search = Category.find(3)
      @chinese_restaurants = Restaurant.where(category_id: 4).near([visitor_latitude, visitor_longitude], 200)
      @chinese_search = Category.find(4)
      @family_restaurants = Restaurant.where(category_id: 5).near([visitor_latitude, visitor_longitude], 200)
      @family_search = Category.find(5)
      @coffee_restaurants = Restaurant.where(category_id: 6).near([visitor_latitude, visitor_longitude], 200)
      @coffee_search = Category.find(6)
    else

      # visitor_latitude = request.location.latitude
      # visitor_longitude = request.location.longitude

      visitor_latitude = 33.7489954
      visitor_longitude = -84.3879824

      @vlat = visitor_latitude
      @vlon = visitor_longitude

      @restaurants = Restaurant.near([visitor_latitude, visitor_longitude], 200)
      @fast_food_restaurants = Restaurant.where(category_id: 1).near([visitor_latitude, visitor_longitude], 200)
      @fast_food_search = Category.find(1)
      @seafood_restaurants = Restaurant.where(category_id: 2).near([visitor_latitude, visitor_longitude], 200)
      @seafood_search = Category.find(2)
      @steak_house_restaurants = Restaurant.where(category_id: 3).near([visitor_latitude, visitor_longitude], 200)
      @steak_house_search = Category.find(3)
      @chinese_restaurants = Restaurant.where(category_id: 4).near([visitor_latitude, visitor_longitude], 200)
      @chinese_search = Category.find(4)
      @family_restaurants = Restaurant.where(category_id: 5).near([visitor_latitude, visitor_longitude], 200)
      @family_search = Category.find(5)
      @coffee_restaurants = Restaurant.where(category_id: 6).near([visitor_latitude, visitor_longitude], 200)
      @coffee_search = Category.find(6)
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @user = current_user
    @reviews = Review.where(restaurant_id: @restaurant)
    if @reviews.blank?
      @average_rating = 0
    else
      @average_rating = @reviews.average(:rating).round(2)
    end
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
      flash[:success] = "Great News! #{@user.username} your review has been saved."
    else
      flash[:error] = "Sorry #{@user.username}, see the errors below and resubmit"
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_restaurant
    @restaurants = Restaurant.query(params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def admin?
    if !current_user.try(:admin?)
      flash[:danger] = "You are not authourized to access this resource."
      redirect_to root_path
    end
  end

  def set_user
    @user = current_user
  end

  def set_the_id
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address1, :address2,
    :city, :state_provence, :postalcode, :phone, :email, :category_id, :image)
  end
end
