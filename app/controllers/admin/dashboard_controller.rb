class Admin::DashboardController < Admin::AdminController
  def index
    @unpublished_posts = Post.unpublished_posts.take(10)
    @post_count = Post.count
    @unpublished_count = Post.unpublished_posts.count
    @project_count = Project.count
    @unpublished_project_count = Project.unpublished.count
  end
end
