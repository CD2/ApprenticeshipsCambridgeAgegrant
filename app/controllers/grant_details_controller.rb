class GrantDetailsController < ApplicationController
  before_action :set_page

  def new
    @grant_detail = GrantDetail.new
  end

  def create
    @grant_detail = GrantDetail.new(grant_detail_params)
    if @grant_detail.valid?
      @grant_detail.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private
    
    def set_page
      @page = Page.friendly.find 'age-grant'
    end

    def grant_detail_params
      params.require(:grant_detail).permit(:forename , :surname, :email, :work_number, :mobile_number, :company_name, :address_line_one, :address_line_two, :learner_name, :learner_dob, :apprentice_start_date, :share_info_checkbox, :training_provider, :bank_name, :account_number, :sort_code, :signature, :password_digest, :title, :terms_conditions)
    end
end
