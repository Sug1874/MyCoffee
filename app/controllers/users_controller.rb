class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = current_user
    @items = @user.items.paginate(page: params[:page], per_page: 8)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activate_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to login_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # 正しいユーザでなければリダイレクト
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless @user == current_user
    end
end
