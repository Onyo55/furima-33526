class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :item_find_params_id, only: [:show, :edit, :update]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_find_params_id
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(
      :item
    ).permit(
      :name, :price, :text, :category_id, :state_id, :prefecture_id, :ship_day_id, :ship_fee_id, :image
    ).merge(user_id: current_user.id)
  end
end
