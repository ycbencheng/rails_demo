class ApplicationController < ActionController::Base
  before_action :authenticate_user

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      redirect_to '/'
  end

  def authenticate_user
    redirect_to signin_path if !current_user
  end
end
