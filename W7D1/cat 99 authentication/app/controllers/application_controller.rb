class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?   #all object can call it in view

    def login(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def current_user #all controller can use it
         return nil if session[:session_token].nil?
         @current_user ||= User.find_by(session_token: session[:session_token])
    end


    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token]=nil
        @current_user=nil
    end

    def require_login
        redirect_to new_session_url unless logged_in?
                                    #if not logged in
    end

    def require_logout
        redirect_to cats_url if logged_in?
    end


end
