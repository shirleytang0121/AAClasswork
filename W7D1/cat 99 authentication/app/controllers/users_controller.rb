class UsersController < ApplicationController
    before_action :require_logout, only: [:new, :create]    

    def new
        @user = User.new
        render :new
    end


    def create
        @user = User.create(params[:username,:password])
        if @user.save
            login(@user)
            redirect_to cats_url
        else
            render json: @user.errors.full_message, status:422
        end
    end

end
