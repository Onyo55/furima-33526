class OrdersController < ApplicationController
  before_action :item_find_item_id
  before_action :authenticate_user!

  def index
    if (current_user.id == @item.user.id) || ( @item.order != nil)
      redirect_to root_path 
    end
    @charge_form = ChargeForm.new
  end

  def create
    @charge_form = ChargeForm.new(charge_form_params)
    if @charge_form.valid?
      payjp_charge
      @charge_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def charge_form_params
    params.require(
      :charge_form
    ).permit(
      :postal_code, :prefecture_id, :city, :block, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find_item_id
    @item = Item.find(params[:item_id])
  end

  def payjp_charge
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: charge_form_params[:token],
      currency: 'jpy'
      )
  end
end
