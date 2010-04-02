class StreamController < ApplicationController
  before_filter :check_public_access

  helper_method :render_to_string
  
  def index

    per_page = params[:format] == 'atom' ? 50 : 10

    if(params[:album_id])
      album = Album.find(params[:album_id])
      @title = "Photo stream for album #{album.title}"
      @photos = album.photos.paginate(:all, :order => 'digitized_at DESC', :page => params[:page], :per_page => per_page)
    elsif(params[:collection_id])
      collection = Collection.find(params[:collection_id])
      @title = "Photo stream for colleciton #{collection.title}"
      @photos = collection.photos.paginate(:all, :order => 'digitized_at DESC', :page => params[:page], :per_page => per_page)
    elsif(params[:tag_id])
      tag = Tag.find(params[:tag_id])
      @title = "Photo stream for tag #{tag.title}"
      @photos = tag.photos.paginate(:all, :order => 'digitized_at DESC', :page => params[:page], :per_page => per_page)
    else
      @title = "Photo stream"      
      @photos = Photo.paginate(:all, :order => 'digitized_at DESC', :page => params[:page], :per_page => per_page)
    end

    respond_to do |format|
      format.html
      format.atom
    end

  end

end
