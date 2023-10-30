class ItemsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
    @item.tastes.new
    @item.areas.new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    # 正しいユーザでなければリダイレクト
    def correct_user
      @item = Item.find(params[:id])
      @user = User.find(@item.user_id)
      if @user != current_user
        flash[:danger] = "Invalid item id"
        redirect_to(root_url, status: :see_other)
      end
    end
end