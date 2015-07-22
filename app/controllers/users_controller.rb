class UsersController < ApplicationController
  def home
  end

  def new
    @user= User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.roles == 'user'
      if @user.save
        flash[:notice] = "Registration successful."
        redirect_to root_url
      else
        render :action => 'new'
      end
    else 
      if @user.save
        
      else
        render :action => 'new'
      end
    end  
  end

  def edit
    @user = current_user
    render 'create'
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def index
    @title = "Users"
    if(request.url.include? "billers")
       @title="Billers"
       @users=User.find(:all,:conditions => {:roles => "biller"})
    elsif (request.url.include? "customers")
      @title="Customers"
      @users=User.find(:all,:conditions => {:roles => "customer"})
    elsif ((request.url.include? "users") && current_user.admin)     
      @users= User.find(:all,:conditions => {:roles => "user",:admin => false})
    else
      flash[:notice] = "Not authorized for current user."
      redirect_to root_url
    end
  end

  def destroy
    @user = User.find(params[:id])
    User.delete(params[:id])
    if@user.roles=="biller"
      redirect_to billers_path
    elsif @user.roles=="customer"
      redirect_to customers_path
    else
      redirect_to users_path
    end
  end
  before_filter :authenticate, :only=> [:edit,:update,:index]
  before_filter :authorize,:only=>[:index]

  def authorize
      if current_user.roles != "user"
        flash[:notice] = "Not A Authourized User!!"
        redirect_to root_url
      end
  end
end  
