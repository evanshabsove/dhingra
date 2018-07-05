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
    @product = Product.find(params[:id])
    @product_group = @product.product_group
    @province = @product_group.province
    if @product.update_attributes(product_params)
      flash[:success] = "Successfully updated product"
      redirect_to edit_province_product_group_url(@province, @product_group)
    else
      flash[:error] = "Something went wrong Please try again"
      redirect_to edit_province_product_group_url(@province, @product_group)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product_group = @product.product_group
    @province = @product_group.province
    if @product.destroy
      flash[:success] = "Successfully deleted product"
      redirect_to edit_province_product_group_url(@province, @product_group)
    else
      flash[:error] = "Something went wrong Please try again"
      redirect_to edit_province_product_group_url(@province, @product_group)
    end
  end

  private
  def product_params
    params.permit(:name, :price, :code, :min)
  end
end
