class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @q = Post.send(locale_param).published_posts.ransack(query_params)
    @posts = @q.result.page(params[:page])
  end

  def show; end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
