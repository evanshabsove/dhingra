class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  def submit_order
    @order = current_order
    @order_items = @order.order_items
    OrderMailer.send_email(@order_items, current_user).deliver
    @order.order_status_id = 2
    if @order.save
      session[:order_id] = nil
      flash[:success] = "Order Placed, we will get back to you as soon as possible"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong, please try again."
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
