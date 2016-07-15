class Admin::GrantDetailsController < ApplicationController
  
  layout 'admin_layout'

  before_action :set_grant_detail, only: [:show, :destroy]

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


private

  def set_grant_detail
    @grant_detail = GrantDetail.find(params[:id])
  end
end
