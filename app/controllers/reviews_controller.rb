class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_listing
  before_action :authenticate_user!

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.listing_id = @listing.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to listing_path(@listing), notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reviews/1
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to listing_path(@listing), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to listing_path(@listing), notice: 'Review was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
