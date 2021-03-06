class GrantReviewsController < ApplicationController

  before_action :logged_in

  def index
  end

  # def update
  #   @grant_detail = current_user.grant_details.find(params[:grant_review][:grant_detail_id])
  #   if @grant_detail.review_submitted
  #     @send_mail = false
  #   else
  #     @send_mail = true
  #   end
  #   if params[:grant_review][:learners_consent] == '0'
  #     redirect_to [:edit, :grant_review]
  #     flash[:error] = 'Please confirm you have to learners consent.'
  #     return
  #   end
  #
  #   current_file_count = @grant_detail.grant_review.documents.count
  #   if params[:grant_review][:new_files]
  #     new_upload_count = params[:grant_review][:new_files].count
  #   end
  #   if params[:grant_review][:documents_attributes]
  #     amount_to_delete = params[:grant_review][:documents_attributes].to_unsafe_h.select{|_, d| d[:_destroy] == '1'}.size
  #   end
  #   total_files_count = current_file_count + (new_upload_count || 0) - (amount_to_delete || 0)
  #
  #   if total_files_count > 5
  #     flash[:error] = 'Sorry, you can only have 5 files per review.'
  #   elsif @grant_detail.grant_review.update grant_review_params
  #     AdminMailer.grant_review_uploaded(@grant_detail, site_email).deliver_now if @send_mail
  #     AdminMailer.grant_review_uploaded_for_p(@grant_detail).deliver_now if @send_mail
  #     redirect_to [:edit, :grant_review]
  #     return
  #   end
  #   render :edit
  # end

  def update
    @review = current_user.grant_reviews.find(params[:id])
    @detail = @review.grant_detail
    if @review.update(grant_review_params)
      if @detail.review_submitted
        flash[:notice] = "Thank you for uploading your documents"
        # unless @detail.document_email_sent
          AdminMailer.grant_review_uploaded_for_p(@detail).deliver_now
        # end
        AdminMailer.grant_review_uploaded(@detail, site_email).deliver_now
      else
        flash[:error] = 'No documents selected'
      end
      redirect_to grant_reviews_path
    else
      flash[:error] = @review.errors.full_messages.join(',')
      render :index
    end
  end

  private


    # Never trust parameters from the scary einternet, only allow the white list through.
    def grant_review_params
      params.require(:grant_review).permit(:learners_consent, new_files: [], documents_attributes: [:id])
    end

    def logged_in
      redirect_to login_path if !signed_in?
    end

end
