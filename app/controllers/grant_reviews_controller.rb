class GrantReviewsController < ApplicationController

  before_action :logged_in
  before_action :not_uploaded
  before_action :set_grant_detail


  def new
    @grant_review = @grant_detail.build_grant_review if @grant_detail
  end

  def create
    @grant_review = @grant_detail.build_grant_review grant_review_params
    if @grant_review.save
      params[:grant_review][:files].each do |file|
        @grant_review.documents.create(document: file)
      end
      redirect_to complete_application_path
    else
      render :new
    end

  end

  private

    def set_grant_detail
      @grant_detail = current_user.grant_detail
    end

    # Never trust parameters from the scary einternet, only allow the white list through.
    def grant_review_params
      params.require(:grant_review).permit(files: [])
    end

    def logged_in
      redirect_to login_path if !signed_in?
    end

    def not_uploaded
      redirect_to complete_application_path if current_user.grant_detail && current_user.grant_detail.grant_review.present?
    end
end
