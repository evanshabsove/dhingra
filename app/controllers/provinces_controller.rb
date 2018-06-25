class ProvincesController < ApplicationController

  def index
    @provinces = Province.all
  end

  def show
    @province = Province.find(params[:id])
    @product_groups = @province.product_groups
  end

  def new
    @province = Province.new
  end

  def create
    @province = Province.new(province_params)

    if @province.save
      redirect_to province_path(@province)
    else
      flash[:error] = "Something went wrong Please try again"
      redirect_to province_path
    end
  end

  def edit
    @province = Province.find(params[:id])
  end

  def update
    @province = Province.find(params[:id])

    if @province.update_attributes(province_params)
      redirect_to province_path(@province)
    else
      flash[:error] = "Something went wrong Please try again"
      redirect_to province_path
    end
  end

  def destroy
    @province = Province.find(params[:id])

    if @province.destroy
      redirect_to province_path
    else
      flash[:error] = "Something went wrong Please try again"
      redirect_to province_path(@province)
    end
  end

  private
  def province_params
    params.require(:province).permit(:name)
  end
end
