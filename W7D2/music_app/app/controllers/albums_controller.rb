class AlbumsController < ApplicationController
    def show 
        @album =Album.find(params[:id])
        if @album
            render :show
        else
            redirect_to album_url(@album)
        end
    end

    def new
        @band =Band.find(params[:band_id])
        @album = Album.new(band_id: params[:band_id])
        render :new
    end

    def create
       @album = Album.new(params.require(:album).permit(:title,:yr,:band_id,:designate,:band))
        @album.band_id = params[:band_id]
        if @album.save
            redirect_to band_url(params[:band_id])
        else
            # flash.now[:errors] = @album.errors.full_messages
            # render :new
            render json:@album.errors.full_messages, status:422
        end
    end


   
end
