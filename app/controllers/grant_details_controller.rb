class GrantDetailsController < ApplicationController

  def new
    @grant_detail = GrantDetail.new
  end

  def create
    @user = User.new(user_params)
    @grant_detail = @user.build_grant_detail(grant_detail_params)
    if @grant_detail.valid? && @user.valid?
      @grant_detail.save!
      @user.save!
      redirect_to application_pending_path
    else
      render :new
    end
  end

  def show
  end

  private

    def grant_detail_params
      params.require(:grant_detail).permit(:forename , :surname, :email, :employment_sector, :work_number, :mobile_number, :company_name, :address_line_one, :address_line_two, :learner_name, :learner_dob, :apprentice_start_date, :share_info_checkbox, :training_provider, :bank_name, :account_number, :sort_code, :signature, :title, :terms_conditions, :address_line_three, :town_name, :county, :postcode)
    end

    def user_params
      params.require(:grant_detail).permit(:email, :password, :password_confirmation)
    end
end
