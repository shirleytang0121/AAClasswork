class ApplicationController < ActionController::Base

    def login(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end
    
    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def logged_in?
        !!current_user
    end

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        redirect_to root_url unless logged_in?
    end

    def require_logged_out
        redirect_to root_url if logged_in?
    end

end
