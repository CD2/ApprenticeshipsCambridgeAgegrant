class AdminController < ApplicationController

  layout 'admin_layout'

  before_action :logged_in



  def logged_in
    redirect_to admin_login_path unless signed_in_as_admin?
  end

end