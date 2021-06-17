class AddIndexToSongTable < ActiveRecord::Migration[5.2]
  def change
    add_index :songs, :name
  end
end
