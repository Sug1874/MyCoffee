class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def redirect_if_not_logged_in
      if !logged_in?
          redirect_to "/login"
      end
    end
end
