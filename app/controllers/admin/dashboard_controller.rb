class Admin::DashboardController < Admin::AdminController
  def index
    @unpublished_posts = Post.unpublished_posts
  end
end
