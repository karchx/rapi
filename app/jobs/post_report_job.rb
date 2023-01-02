class PostReportJob < ApplicationJob
  queue_as :default

  def perform(user_id, post_id)
    user = User.find(user_id)
    post = Post.fin(post_id)
    report = PostReport.generate(post)
  end
end
