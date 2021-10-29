class ApplicationController < ActionController::Base
  before_action :set_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def set_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end
  def require_user_logged_in!
    redirect_to sign_in_path, alert: "You must be signed in to do that." if @user.nil?
  end
end
