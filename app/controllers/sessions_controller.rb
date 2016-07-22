class SessionsController < ApplicationController

  before_action :not_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to new_grant_review_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if signed_in?
    redirect_to root_url(subdomain: false)
  end

  private

  def not_logged_in
    redirect_to root_url if signed_in? || signed_in_as_admin?
  end

end

