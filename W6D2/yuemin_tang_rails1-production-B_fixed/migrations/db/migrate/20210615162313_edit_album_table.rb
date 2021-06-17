class EditAlbumTable < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :year, :integer, null:false
    add_index :albums, :artist_id
  end
end
