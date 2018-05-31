class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @q = Post.ransack(query_params)
    @posts = @q.result
  end

  def show; end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
