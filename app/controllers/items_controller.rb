class ItemsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = current_user
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "New item created"
      redirect_to root_path
    else
      flash[:danger] = "Failed to create new item"
      redirect_to root_path
    end
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
    Item.find(params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to root_path
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

    def item_params
      params.require(:item).permit(:name, :bitterness, :acidity, :body, :roast, :variety, :process, :farm, :shop_url, :description,
                                    tastes_attributes: [:taste], areas_attributes: [:area])
    end
end