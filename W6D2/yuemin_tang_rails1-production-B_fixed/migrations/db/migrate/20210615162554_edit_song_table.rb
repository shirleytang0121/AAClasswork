class EditSongTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :title
    add_column :songs, :name, :string
    remove_column :songs, :artist_id
  end
end
