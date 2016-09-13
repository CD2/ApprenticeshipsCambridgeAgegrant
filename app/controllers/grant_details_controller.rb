class GrantDetailsController < ApplicationController

  def new
    if signed_in? && current_user.grant_details.any?
      @grant_detail = current_user.grant_details.first.dup
      @grant_detail.assign_attributes learner_name: nil, learner_dob: nil, apprentice_start_date: nil, training_provider_id: nil, signature: nil
    end
    @grant_detail ||= GrantDetail.new
  end

  def create
    if params[:grant_detail][:trade_supplier_type].blank?
      params[:grant_detail][:trade_supplier_type] = params[:trade_supplier_type_select]
    end
    if signed_in?
      user = current_user
      user.assign_attributes(user_params.except :password, :password_confirmation)
    else
      user = User.new(user_params)
    end
    @grant_detail = user.grant_details.build(grant_detail_params)
    if @grant_detail.valid? && user.valid?
      @grant_detail.save!
      AdminMailer.no_training_provider(@grant_detail, site_email).deliver_now if @grant_detail.training_provider.nil?
      user.save!
      log_in user unless signed_in?
      redirect_to application_pending_path
    else
      render :new
    end
  end

  def show
  end


  private

    def grant_detail_params
      params.require(:grant_detail).permit(:forename , :surname, :email, :employment_sector,
        :work_number, :mobile_number, :company_name, :address_line_one, :address_line_two,
        :learner_name, :learner_dob, :apprentice_start_date, :share_info_checkbox, :training_provider,
        :bank_name, :bank_address, :trade_supplier_type_select, :trade_supplier_type, :account_number, :sort_code, :signature,
        :title, :terms_conditions, :address_line_three, :town_name, :county, :postcode, :account_name)
    end

    def user_params
      params.require(:grant_detail).permit(:email, :password, :password_confirmation)
    end
end
