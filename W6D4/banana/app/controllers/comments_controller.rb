class CommentsController < ApplicationController
    def index
        if params[:user_id]
            @comments = Comment.where(user_id: params[:user_id])
        elsif params[:artwork_id]
        
            #find is searching with id
            #find_by is only value
            @comments = Comment.where(artwork_id: params[:artwork_id])

        else
            @comments = Comment.all

        end
        # @comments = Comment.all
       render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save!
            render json:@comment
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy!
            redirect_to comments_url
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end
    
    private

    def comment_params
        # if passed 2 
        #user_id = 5
        #artwork_id = 14
        

        params.require(:comment).permit(:body, :user_id, :artwork_id)
    end
    
end