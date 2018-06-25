class ProductGroupsController < ApplicationController

  def new
    @province = Province.find(params[:province_id])
    @product_group = ProductGroup.new
  end

  def show
    @province = Province.find(params[:province_id])
    @product_group = ProductGroup.find(params[:id])
    @products = @product_group.products
  end

  def create
    @province = Province.find(params[:province_id])
    @product_group = @province.product_groups.create(painting_params)

    if @product_group.save
      flash[:success] = "Product Group Saved"
      redirect_to province_product_group_path(@province, @product_group)
    else
      flash[:error] = "Something went wrong"
      redirect_to province_path(@province)
    end
  end

  def edit
    @province = Province.find(params[:province_id])
    @product_group = ProductGroup.find(params[:id])
    @products = @product_group.products
  end

  def update

    @province = Province.find(params[:province_id])
    @product_group = ProductGroup.find(params[:id])

    if params[:product_group][:title]
      title = params[:product_group][:title]
    else
      title = @product_group.title
    end

    if params[:product_group][:image] != nil
      @product_group.title = title
      if @product_group.save
        if params[:product_group][:product][:name] != nil
          @product = Product.new({
            name: params[:product_group][:product][:name],
            price: params[:product_group][:product][:price],
            code: params[:product_group][:product][:code],
            min: params[:product_group][:product][:min],
            product_group_id: @product_group.id
          })
          if @product.save
            flash[:success] = "Success! You added a new product"
            redirect_to edit_province_product_group_path(@province, @product_group)
          else
            flash[:success] = "Something went wrong product not added"
            redirect_to edit_province_product_group_path(@province, @product_group)
          end
        else
          flash[:success] = "Success! You have upated the product group"
          redirect_to edit_province_product_group_path(@province, @product_group)
        end
      else
        flash[:error] = "Something Went wrong please try again"
      end
    else
      @product_group.title = title
      @product_group.image = params[:product_group][:image]
      if @product_group.save
        if params[:product_group][:product][:name] != nil
          @product = Product.new({
            name: params[:product_group][:product][:name],
            price: params[:product_group][:product][:price],
            code: params[:product_group][:product][:code],
            min: params[:product_group][:product][:min],
            product_group_id: @product_group.id
          })
          if @product.save
            flash[:success] = "Success! You added a new product"
            redirect_to edit_province_product_group_path(@province, @product_group)
          else
            flash[:success] = "Something went wrong product not added"
            redirect_to edit_province_product_group_path(@province, @product_group)
          end
        else
          flash[:success] = "Success! You have upated the product group"
          redirect_to edit_province_product_group_path(@province, @product_group)
        end
      else
        flash[:error] = "Something Went wrong please try again"
      end
    end
  end

  private
  def painting_params
    params.require(:product_group).permit(:title, :image)
  end

end
