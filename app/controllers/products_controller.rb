class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def create
    #code
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end
end
