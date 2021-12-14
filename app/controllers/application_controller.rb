class ApplicationController < ActionController::Base

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:redirect_url] = request.url
     return redirect_to login_path, alert: 'Are you Guru? Veify your email and password'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
