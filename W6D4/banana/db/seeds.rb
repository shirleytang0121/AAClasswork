# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all

    users = User.create([{username: 'shirley99'}, {username: 'canberko560'}, {username: 'whatswrongandy'}, {username: 'Leonardo DaVinci'},{username: 'Jack'}])
    artwork1= Artwork.create({title: 'Mona lisa', image_url: 'www.monalisa.com', artist_id: users.first.id})
    artwork2= Artwork.create({title: 'David', image_url:'www.david.com', artist_id: users.second.id }) 
    artwork3= Artwork.create({title: 'Leo', image_url:'www.Leo.com', artist_id: users.second.id }) 
    artwork_shares=ArtworkShare.create({artwork_id: artwork1.id, viewer_id: users.last.id}) 
    comment1 = Comment.create({body: 'I can do better than Leonardo DaVinci', user_id: users.first.id, artwork_id: artwork1.id})
    comment2 = Comment.create({body: 'I don''t know!', user_id: users.first.id, artwork_id: artwork3.id})
    comment3 = Comment.create({body: 'I''ve seen better lololol!!!!', user_id: users.last.id, artwork_id: artwork3.id})
    

    like1 = Like.create({likeable_type: 'Comment', likeable_id: comment3.id, liker_id: users.first.id})
    like2 = Like.create({likeable_type: 'Artwork', likeable_id: artwork1.id, liker_id: users.last.id})
    like3 = Like.create({likeable_type: 'Artwork', likeable_id: artwork1.id, liker_id: users.last.id})



