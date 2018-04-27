class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to [:root]
    else
      redirect_to [:root]
    end
  end

  def destroy
    session[:id] = nil
    redirect_to [:root]
  end
end
