class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  before_action :authenticate_user!, only: [:index, :create]
  before_action :remove_sold_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def remove_sold_item
    redirect_to root_path unless Order.find_by(item_id: @item.id) == nil
  end

  def remove_item_user
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
