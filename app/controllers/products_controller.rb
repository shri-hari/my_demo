class ProductsController < ApplicationController
  def new
  	@product = Product.new()
  end

  def create
  	@product = Product.new(params[:product])
  	if @product.save
  		flash[:notice] = "Product created successfully."
  		redirect_to root_url
  	else
  		render :action => 'new'
  	end  	
  end

  def index
    @products = Product.all()
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product =Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to products_path
    end
  end

  def destroy
    Product.delete(params[:id])
    redirect_to products_path
  end

  before_filter :authenticate, :only => [:new,:edit,:show,:update,:index,:delete]
  before_filter :authorize,:only =>[:new,:edit,:show,:update,:index,:delete]

  def authorize
      if current_user.roles != "user"
        flash[:notice] = "Not A Authourized User!!"
        redirect_to root_url
      end
  end

end
