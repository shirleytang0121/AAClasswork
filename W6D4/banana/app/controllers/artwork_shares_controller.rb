class ArtworkSharesController < ApplicationController
    def index
        @artwork_shares=ArtworkShare.where(viewer_id: params[:id]) || 'the user did not view any artworks'
        render json: @artwork_shares
    end

    def create
        @artwork_share = ArtworkShare.new(artwork_share_params)
        if @artwork_share.save!
            render json:@artwork_share     
        else
            render json: @artwork_share.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id])
        if @artwork_share.destroy!
            redirect_to artwork_shares_url
        else
            render json: @artwork_share.errors.full_messages, status: 422 
        end
    end

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:viewer_id,:artwork_id)
    end


end