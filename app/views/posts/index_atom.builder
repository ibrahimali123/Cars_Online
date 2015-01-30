atom_feed do |feed|
  feed.title "MY BLOG feed"

  @posts.each do |post|	
  feed.entry(post) do |entry|
    entry.title post.title
    entry.content post.body 
    end
  end # end feed.entry


end # end @posts.each