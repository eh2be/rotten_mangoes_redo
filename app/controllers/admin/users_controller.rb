class Admin::UsersController < ApplicationController

  # before_filter :authenticate_user!
  before_filter :is_admin?

  def admin?
    self.admin == true
  end

  def index
    @users = User.order("lastname").page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_path
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

  protected

  def is_admin?
    if current_user.admin?
      true
    else
      # render :text => "Buhbye"
      redirect_to movies_path
    end
  end

end
