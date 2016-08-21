class RestaurantsController < ApplicationController
  before_action :admin?, only: [:edit, :update, :destroy,]
  before_action :set_user, only: [:index, :create, :update, :destroy]
  before_action :set_the_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
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
