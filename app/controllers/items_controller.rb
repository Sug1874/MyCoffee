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
      flash[:danger] = "Create new item failed"
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
    @item = Item.find(params[:id])
    ActiveRecord::Base.transaction do
      if @item.update!(item_params)
        if item_params.has_key?(:tastes_attributes)
          item_params[:tastes_attributes].each do |taste_hash|
            if (!taste_hash[1].has_key?(:taste)) && taste_hash[1].has_key?(:id)
              Taste.find(taste_hash[1][:id]).destroy!
            end
          end
        end

        if item_params.has_key?(:areas_attributes)
          item_params[:areas_attributes].each do |area_hash|
            if (!area_hash[1].has_key?(:area)) && area_hash[1].has_key?(:id)
              Area.find(area_hash[1][:id]).destroy!
            end
          end
        end

        flash[:success] = "Item updated"
        redirect_to @item
      else
        flash[:danger] = "Item update failed"
        redirect_to @item
      end
    end
  rescue
    flash[:danger] = "Item update failed"
    redirect_to @item
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
                                    tastes_attributes: [:taste, :id], areas_attributes: [:area, :id])
    end
end