class Admin::GrantDetailsController < ApplicationController
  
  layout 'admin_layout'

  before_action :set_grant_detail, only: [:show, :destroy]

  def index
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
