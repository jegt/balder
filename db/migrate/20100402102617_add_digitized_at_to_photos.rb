class AddDigitizedAtToPhotos < ActiveRecord::Migration
  def self.up
    add_column(:photos, :digitized_at, :timestamp)
  end

  def self.down
  end
end
