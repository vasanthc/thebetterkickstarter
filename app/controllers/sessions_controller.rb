class SessionsController < ApplicationController

  # The login form
  def new
    @user = User.new
  end

  # Authenticating the login form post
  def create
    @user = User.where(:email => params[:user][:email]).first

    if @user.present? and @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to products_url, :notice => "Logged in!"
    else
      @user = User.new params[:user]
      flash.now[:alert] = "bad username or password"
      render :new, :status => 500
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to products_url
    # redirect_to products_url, :notice => "Logged out!"
  end

end