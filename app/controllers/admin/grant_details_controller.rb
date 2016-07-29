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
    file = @grant_detail.grant_review.documents.find(params[:gid]).document.file
    filename = file.filename
    send_file file.file, filename: filename
  end


private

  def set_grant_detail
    @grant_detail = GrantDetail.find(params[:id])
  end
end
