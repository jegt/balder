class StreamController < ApplicationController
  before_filter :check_public_access

  def index
    @photos = Photo.find(:all, :order => 'digitized_at DESC', :limit => 10)

    respond_to do |format|
      format.html
      format.atom
    end

  end

end
