class ManagementController < ApplicationController
  skip_before_action :verify_authenticity_token, only:[:create]
  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.json {render json:@products}
    end

  end
  def show
    @products = products
  end
  def new
    @products = Product.new
  end
  def create
    puts product_params
    @products = Product.new(product_params)
    if @products.save
      redirect_to root_path
    else
      render :new
    end

    respond_to do |format|
      format.html
      format.json {render json:@product}
    end
  end

  def edit
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render json:@products}
    end

  end
  def update
    if @products.update(product_params)
      redirect_to root_path
    else
      render :new
    end
    respond_to do |format|
      format.html
      format.json {render json:@products}
    end

  end

  def delete
    @product = Product.find(params[:id])
    if @product.delete
      redirect_to root_path
    else
      render :new
    end
    respond_to do |format|
      format.html
      format.json {render json:@product}
    end


  end

  private
    def product_params

      params.require(:product).permit(:name , :price, :description)
    end
end
