class ApplicationController < ActionController::API
    skip_before_action :verify_authenticity_token, raise: false
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!
    def user_id
      if decoded_token
        decoded_token[0]["user_id"]
      end
    end
    def login!
      session[:user_id] = @user.id
    end
  def logged_in?
    session[:user_id] = @user_id
    end
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  def authorized_user?
       @user == current_user
     end
  def logout!
       session.clear
     end
     def fallback_index_html
      render :file => '/index.js'
     end
end
