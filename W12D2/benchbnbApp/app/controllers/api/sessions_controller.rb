class Api::SessionsController < ApplicationController

    before_action :require_logged_out, only: [:create]
    before_action :require_logged_out, only: [:destroy]

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login(@user)
            render :show
        else
            render json: @user.errors.full_messages
        end
    end

    def destroy
        if logged_in?
            logout
            render json: {}
        else
            render json: "not logged in", status: 404
        end
    end

end
