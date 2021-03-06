class Collection < ActiveRecord::Base
  has_many :collection_albums
  has_many :albums, :through => :collection_albums

  attr_accessor :album_list

  def photos
    Photo.find(:all, :include => { :album => :collections }, :conditions => ["collections.id = ?", self.id])
  end

  def to_param
     "#{id}-#{title.parameterize}"
  end
  
  def album_list=(albums)
    self.albums = Album.find(albums.map{|album|album[0]})
  end

end