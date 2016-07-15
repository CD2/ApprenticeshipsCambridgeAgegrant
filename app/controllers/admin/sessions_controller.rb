class Admin::SessionsController < AdminController

  skip_before_action :logged_in
  before_action :not_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.admin == false
      flash.now[:error] = 'No user found with that email address'
      render 'new'
    elsif user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if signed_in?
    redirect_to admin_root_path
  end

  private

  def not_logged_in
    redirect_to root_url if signed_in_as_admin?
  end

end

