class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show]
    before_action :require_logged_out, only:[:new, :create]

    def show
        @user = User.find(params[:id])
        if @user
            render :show
        else
            render json: @user.errors.full_message, status:422
        end
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to bands_url
        else
            render json: @user.errors.full_messages, status:422
        end
    end


    private
    def user_params
        params.require(:user).permit(:email,:password)
    end
end
