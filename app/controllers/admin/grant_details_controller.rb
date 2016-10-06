class Admin::GrantDetailsController < AdminController

  before_action :set_grant_detail, except: [:index, :search]

  def index
    if params[:training_provider_id]
      @training_provider_name = TrainingProvider.find(params[:training_provider_id]).name
      @grant_details = TrainingProvider.find(params[:training_provider_id]).grant_details
    else
      @grant_details = GrantDetail.includes(:user).all
    end
    respond_to do |format|
      format.html
      format.csv { send_data GrantDetail.to_csv, filename: "grant-details-#{Date.today}.csv" }
    end
  end

  def show
  end

  def search
    @q = GrantDetail.ransack(params[:q])
    @grant_details = @q.result(distinct: true)
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

  def download_pro_forma_invoice
    respond_to do |format|
      format.html { redirect_to [:admin, @grant_detail] }
      format.docx { render docx: 'pro_forma', filename: 'pro_forma.docx' }
    end
  end

  def send_no_training
    AdminMailer.no_training_provider(@grant_detail, site_email).deliver_now if @grant_detail.training_provider.nil?
    redirect_to admin_grant_detail_path @grant_detail
  end

  def notify_training_provider
    AdminMailer.notify_training_provider(@grant_detail).deliver_now
    redirect_to admin_grant_detail_path @grant_detail
  end

  def edit
  end

  def update
    if @grant_detail.update(grant_detail_params)
      redirect_to admin_grant_detail_path(@grant_detail)
    else
      render :edit
    end
  end

  def approve
    unless @grant_detail.approved?
      @grant_detail.approve!
    end
    redirect_to [:admin, @grant_detail]
  end


private

  def set_grant_detail
    @grant_detail = GrantDetail.find(params[:id])
  end

  def grant_detail_params
    params.require(:grant_detail).permit(:notes, :forename , :surname, :email, :employment_sector, :work_number, :mobile_number, :company_name, :address_line_one, :address_line_two, :learner_name, :learner_dob, :apprentice_start_date, :share_info_checkbox, :training_provider, :bank_name, :account_number, :sort_code, :signature, :title, :terms_conditions, :address_line_three, :town_name, :county, :postcode)
  end

end
