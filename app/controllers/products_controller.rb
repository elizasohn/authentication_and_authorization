class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully created!"
      redirect_to products_path
    else
      flash[:notice] = "Product was not created!"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    if params[:most_recent]
      @products = @products.most_recent(params[:most_recent])
    else
      @product = Product.find(params[:id])
    end 
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    flash[:alert] = "Product successfully updated!"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
          flash[:notice] = "You've deleted this product!"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end
end
