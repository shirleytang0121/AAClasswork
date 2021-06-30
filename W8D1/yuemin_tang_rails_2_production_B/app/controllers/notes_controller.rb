class NotesController < ApplicationController
    before_action :require_login
    def create
        @note = Note.new(note_params)
        @note.user_id = params[:user_id]
        if !@note.save
            flash[:errors] = @note.errors.full_messages
        end
        redirect_to user_url(@note.user_id)
        
    end

    def edit
        @note = Note.find_by(id: params[:id])
        render :edit
    end

    def update
        @note = Note.find_by(id: params[:id])
        if current_user.id == @note.user_id && @note.update(note_params) 
            redirect_to user_url(@note.user_id)
        else
            flash[:errors]= ['Something went wrong!']
            render :edit
        end

       
    end

    private
    
    def note_params
        params.require(:note).permit(:title,:description,:secret)
    end

end
