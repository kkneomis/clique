class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  respond_to :html

  def index
    @orders = Order.all

  end

  def show

  end

  def new
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    @seller= @item.user
    
    @order.buyer_id = current_user.id
    @order.seller_id =@seller.id
    @order.item_id = @item.id
    @order.price = @item.price
    
    if @order.save
      redirect_to @order.paypal_url(root_url)
    end
  
  end



  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:address, :city, :state, :zip, :user_id, :item_id, :quantity)
    end
end
