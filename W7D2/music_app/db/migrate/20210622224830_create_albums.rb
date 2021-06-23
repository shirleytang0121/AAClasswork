class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null:false
      t.string :yr, null:false
      t.string :designate, null:false
      t.integer :band_id, null:false
      t.timestamps
    end
  end
end
