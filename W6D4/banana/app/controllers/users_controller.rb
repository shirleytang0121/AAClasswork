class UsersController < ApplicationController

    def index
        if params[:username]
            @users = User.where(username: params[:username])
        else
            @users = User.all
        end
        render json: @users
    end

    def create
        @user = User.new(user_params)
        if @user.save!
            render json: @user
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def show
        # # render plain: "Hi"
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])

        if @user.update!(user_params)
            render json: @user
        else
            render json: @user.errors.full_messages, status: 422
        end

    end

    def destroy
        @user = User.find(params[:id])

        @user.destroy
            redirect_to users_url
        

    end



    private

    def user_params
        params.require(:user).permit(:username)
    end
    

end