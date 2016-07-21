class Admin::GrantDetailsController < AdminController
  
  before_action :set_grant_detail, except: :index

  def index

    respond_to do |format|
      format.html
      format.csv { send_data GrantDetail.to_csv, filename: "grant-details-#{Date.today}.csv" }
    end
  end

  def show
  end

  def destroy
    @grant_detail.destroy
    redirect_to admin_grant_details_path
  end

  def download_evidence
    send_file @grant_detail.grant_review.file.path, filename: @grant_detail.grant_review.file.file.filename
  end


private

  def set_grant_detail
    @grant_detail = GrantDetail.find(params[:id])
  end
end
