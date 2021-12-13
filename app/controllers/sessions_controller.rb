class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:redirect_url) || root_path
    else
      flash.now[:alert] = 'Check email and password'
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
