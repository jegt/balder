
class Mailer < ActionMailer::Base

  def receive(email)

    subject = email.subject.strip

    user = User.find_by_email(email.from.first)

    return if user.nil?

    album = Album.find_by_title(subject)
    album = Album.find_by_id(subject.to_i) if album.nil?
    album = user.default_album if album.nil?

    if email.has_attachments?
      for attachment in email.attachments

        p = Photo.new(:album_id => album.id)
        p.swf_uploaded_data = attachment
        p.save!

      end
    end
    


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
