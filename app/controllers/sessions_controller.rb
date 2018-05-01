class SessionsController < ApplicationController

  def new

  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:id] = user.id
      redirect_to [:root]
    else
      render new_session_path
    end
  end

  def destroy
    session[:id] = nil
    redirect_to [:root]
  end
end
