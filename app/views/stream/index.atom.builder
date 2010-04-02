atom_feed(:root_url => stream_url()+"?#{request.query_string}", :schema_date => "2010-04-02") do |feed|
  feed.title(@title)
  feed.updated(@photos.first.created_at)

  for photo in @photos
    feed.entry(photo, { :url => photo_url(photo), :published => photo.created_at, :updated_at => photo.updated_at }) do |entry|
      # entry.title(activity_title(activity))  #activity.description_presentation)

      entry.title("#{photo.title}")

      entry.content(render_to_string(:partial => 'photo', :locals => {:photo => photo}), :type => 'html')

#        entry.author do |author|
#          author.name(activity.user.fullname)
#          author.email(activity.user.email)
#        end
    end
  end
end