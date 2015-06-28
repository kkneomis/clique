class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :ship]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :sales, :purchases]

  respond_to :html

  protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    logger.info(params.to_s)
    status = params[:payment_status]
    if status == "Completed"
      @order = Order.find params[:invoice]
      @order.update_attributes(notification_params: params.to_s, status: status, transaction_id: params[:txn_id], purchased_at: Time.now)
      CliqueMailer.sale(@order.seller).deliver
      CliqueMailer.purchase(@order.buyer).deliver
    end
    render nothing: true
  end
  
  
  def index
    @orders = Order.all

  end

  def show
  end

  def sales
    @orders= Order.all.where(status: "Completed").where(seller: current_user).order("created_at DESC")
    
  end
  
  def purchases
    @orders= Order.all.where(status: "Completed").where(buyer: current_user).order("created_at DESC")
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
    
    @order.shipped = false
    @order.buyer_id = current_user.id
    @order.seller_id =@seller.id
    @order.item_id = @item.id
    @order.price = @item.price
    

    if @order.save
      redirect_to @order.paypal_url(root_url)
    end
  
  end

  def ship
    @order.update_attributes(:shipped => true)
    redirect_to(sales_path)
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
      params.require(:order).permit(:address, :city, :state, :zip, :user_id, :item_id, :quantity, :notification_params,  :status,:transaction_id, :purchased_at, :shipped )
    end
end
