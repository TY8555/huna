class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

     helper_method :normal_user
     
    def normal_user
        if session[:user_id]
          @user ||= User.find(session[:user_id])
        end
          
          
    end
    
    def require_user
        redirect_to "/" unless normal_user
        
    end

end