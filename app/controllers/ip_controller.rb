class IpController < ApplicationController

  def index
    render :text => request.remote_ip.to_s
  end

end
