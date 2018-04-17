class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy]
  before_action :categories, only: [:shop, :edit, :new, :create]


  def seller
    if current_user.admin?
      @listings = Listing.all.order("created_at DESC")
    else
      @listings = Listing.where(user: current_user).order("created_at DESC")
    end
  end

  # GET /listings
  def shop
    if params[:category].blank?
      @listings = Listing.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @listings = Listing.where(:category_id => @category_id).order("created_at DESC")
    end 
  end

  # GET /listings
  def index
    @history = OrderItem.all.where(buyer_id: current_user).order("created_at DESC")
    @listings = Listing.limit(4).order("created_at DESC")   
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")    
  end

  # GET /listings/1
  def show
     @order_item = current_order.order_items.new
     @listings = Listing.all
     @reviews = Review.where(listing_id: @listing.id).order("created_at DESC")
       if @reviews.blank?
        @avg_rating = 0
      else
        @avg_rating = @reviews.average(:rating).round(2)
      end 
  end
 
  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.category_id = params[:category_id]

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /listings/1
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
    end
  end

def search
  #@search_term = params[:q]
  st = "%#{params[:q]}%"
  @listings = Listing.where("title like ?", st)
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params  params.require(:listing).permit(:title, :artist, :description, :price, :image, :user_id, :category_id)
    end

    def categories
      @categories = Category.all.map{ |c| [c.name, c.id] }
    end
end






 