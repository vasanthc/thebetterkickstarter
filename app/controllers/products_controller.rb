class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @review = Review.new

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def index
    @products = Product.all

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path }
      format.json { head :no_content }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path(@product.id) }
        format.json { render json: @product }
      else
        format.html do
          flash.now[:alert] = "Mistakes were made. Forms were mis-filled in. Move on."
          render :new
        end
        format.json { render json: @product.errors, status: :unprocessable_entity  }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to product_path(@product.id) }
        format.json { render json: @product }
      else
        format.html do
          flash.now[:alert] = "Mistakes were made. Forms were mis-filled in. Move on."
          render :edit
        end
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

end