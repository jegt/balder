
class Mailer < ActionMailer::Base

  def receive(email)
    logger.debug email.inspect
=begin
    page = Page.find_by_address(email.to.first)
    page.emails.create(
            :subject => email.subject,
            :body => email.body
    )

    if email.has_attachments?
      for attachment in email.attachments
        page.attachments.create({
                :file => attachment,
                :description => email.subject
        })
      end
    end
=end
  end

end
