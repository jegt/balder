class AddDefaultAlbumIdToUser < ActiveRecord::Migration
  def self.up
    add_column(:users, :default_album_id, :integer)
  end

  def self.down
  end
end
