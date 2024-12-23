class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_product, only: %i[ show edit update destroy ]

  @@default_price = 10.00

  def index
    @products = Product.all
  end

  def show
    @product.price = @product.price || @@default_price
    @product.discount_percentage = @product.discount_percentage || 0.00

    puts "Price: #{@product.price}"
    @discounted_price = @product.price - ProductCalculatorService.new(@product.price, @product.discount_percentage).compute_discount
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.expect(product: [ :name, :description ])
    end
end
