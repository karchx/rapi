class PostsSearchService
  def self.search(current_posts, query)
    Rails.cache.fetch("", expires_in: 1.hours)
    current_posts.where("title like '%#{query}%'")
  end
end
