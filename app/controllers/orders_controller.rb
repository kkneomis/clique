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
    
     customer = Stripe::Customer.create(
       :email => current_user.email,
        :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @order.price * 100,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

    rescue Stripe::CardError => e
      flash[:error] = e.message
     redirect_to @order.item
   
  
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
