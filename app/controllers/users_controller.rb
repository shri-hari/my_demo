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
        flash[:notice] = "Please enter the below fields to complete registration."
        user_id(@user.id)
      else
        render :action => 'new'
      end
    end  
  end

  def edit
    @user = current_user
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

  
end  
