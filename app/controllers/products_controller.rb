class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = session[:cart] ||= {}
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully destroyed.'
  end

  def add_to_cart
    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    add_product_to_cart(product_id, quantity)
    redirect_to product_path(product_id), notice: 'Product added to cart.'
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end
