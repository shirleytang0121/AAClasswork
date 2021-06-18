class Artwork < ApplicationRecord

    validates :title, :image_url, :artist_id, presence: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: 'User'
        

    has_many :viewers,
        foreign_key: :artwork_id,
        class_name: 'ArtworkShare'
    
    has_many :shared_viewers,
        through: :viewers,
        source: :viewer


    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :likes,
        as: :likeable


    #create a class method which returns 
    #ALL of the artworks made by the user and shared by the user
    

    def self.artworks_for_user_id(user_id)

        Artwork
            .joins(:shared_viewers)
            .where('(artworks.artist_id = (?)) OR (artwork_shares.viewer_id = (?))',user_id, user_id).distinct
    end

end