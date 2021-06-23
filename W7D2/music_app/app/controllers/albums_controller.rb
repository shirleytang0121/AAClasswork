class AlbumsController < ApplicationController
    def show 
        @album =Album.find(params[:id])
        if @album
            render :show
        else
            redirect_to albums_url
        end
    end

    def new
        @album = Album.new
        render :new
    end

    def create
        if params.has_key?(:band_id)
            @album = Album.new(title: params[:title],yr:params[:yr],designate:params[:designate],band_id:params[:band_id] )
        else
            render :new
        end

        if @album.save
            redirect_to albums_url
        else
            render :new
        end
    end


   
end
