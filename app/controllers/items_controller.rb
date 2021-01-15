class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index] 

  def index
  end

  def new
    @item = Item.new
    pull_down
  end

  def create
    @item = Item.new(item_params)
    pull_down
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :shipping_fee_id, :shipping_place_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index 
    unless user_signed_in? 
      redirect_to action: :index 
    end
  end

  def pull_down
    @categories = Category.all
    @states = State.all
    @shipping_fees = ShippingFee.all
    @shipping_places = ShippingPlace.all
    @days = Day.all
  end
end
