atom_feed(:root_url => root_url(:query => @query), :schema_date => "2010-03-23") do |feed|
  feed.title("Fisklistan: #{@query}")
  if (@fish && @fish.size > 0)
    feed.updated(Time.now.utc)

    for fish in @fish
      feed.entry(fish, { :url => root_url(:query => @query), :published => fish.fish_list.created_at, :updated_at => fish.created_at }) do |entry|
       # entry.title(activity_title(activity))  #activity.description_presentation)

        entry.title("#{fish.common_name} (#{fish.latin_name}) #{(fish.price*3).round}kr")

        entry.content("#{fish.common_name} (#{fish.latin_name}) #{(fish.price*3).round}kr", :type => 'html')

#        entry.author do |author|
#          author.name(activity.user.fullname)
#          author.email(activity.user.email)
#        end
      end
    end
  end
end