class Admin::UsersController < AdminController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.admin_users
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.admin = true
    if @user.valid?
      @user.save!
      flash[:notice] = 'User created'
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.valid?
      @user.save!
      flash[:notice] = 'User updated'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User deleted'
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.admin_users.find(params[:id])
  end
end
