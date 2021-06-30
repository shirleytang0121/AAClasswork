class ApplicationController < ActionController::Base
    helper_method :current_user, :loggin?

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end


    def current_user
        return nil if session[:session_token].nil?
        @current_user = User.find_by(session_token: session[:session_token])
    end

    def loggin?
        !!current_user
    end

    def logout!
        current_user.reset_session_token! if loggin?
        session[:session_token] = nil
        @current_user = nil
    end

    def require_login
        redirect_to new_session_url unless loggin?
    end


end
