class GrantReviewsController < ApplicationController
  before_action :set_grant_review, only: [:show, :edit, :update, :destroy]

  # GET /grant_reviews
  # GET /grant_reviews.json
  def index
    @grant_reviews = GrantReview.all
  end

  # GET /grant_reviews/1
  # GET /grant_reviews/1.json
  def show
  end

  # GET /grant_reviews/new
  def new
    @grant_review = GrantReview.new
  end

  # GET /grant_reviews/1/edit
  def edit
  end

  # POST /grant_reviews
  # POST /grant_reviews.json
  def create
    @grant_review = GrantReview.new(grant_review_params)

    if @grant_review.save
      redirect_to complete_application_path
    else
      render :new
    end

  end

  # PATCH/PUT /grant_reviews/1
  # PATCH/PUT /grant_reviews/1.json
  def update
    respond_to do |format|
      if @grant_review.update(grant_review_params)
        format.html { redirect_to @grant_review, notice: 'Grant review was successfully updated.' }
        format.json { render :show, status: :ok, location: @grant_review }
      else
        format.html { render :edit }
        format.json { render json: @grant_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grant_reviews/1
  # DELETE /grant_reviews/1.json
  def destroy
    @grant_review.destroy
    respond_to do |format|
      format.html { redirect_to grant_reviews_url, notice: 'Grant review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grant_review
      @grant_review = GrantReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grant_review_params
      params.require(:grant_review).permit(:file)
    end
end
