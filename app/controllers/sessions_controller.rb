class SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Hello, #{current_user.first_name}"
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
