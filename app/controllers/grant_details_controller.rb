class GrantDetailsController < ApplicationController

  def new
    @grant_detail = GrantDetail.new
  end

  def create
    @grant_detail = GrantDetail.new(grant_detail_params)
    if @grant_detail.valid?
      @grant_detail.save!
      redirect_to application_pending_path
    else
      render :new
    end
  end

  def show
  end

  private

    def grant_detail_params
      params.require(:grant_detail).permit(:forename , :surname, :email, :work_number, :mobile_number, :company_name, :address_line_one, :address_line_two, :learner_name, :learner_dob, :apprentice_start_date, :share_info_checkbox, :training_provider, :bank_name, :account_number, :sort_code, :signature, :password_digest, :title, :terms_conditions, :address_line_three, :town_name, :county, :postcode, :password_confirmation)
    end
end
