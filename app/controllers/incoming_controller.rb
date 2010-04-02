class IncomingController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def index
    logger.info "Incoming mail from: "+request.remote_ip.to_s
    if params[:mail] && request.remote_ip == APP_CONFIG[:mail_server_ip]
      Mailer.receive(params[:mail])
    end
  end

end
