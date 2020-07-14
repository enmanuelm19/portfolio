class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @q = Post.send(locale_param).published_posts.ransack(query_params)
    @posts = @q.result.page(params[:page])
  end

  def show
    @meta_title = meta_title @post.title
    @meta_description = @post.title
    set_og_properties
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def set_og_properties
    @og_properties = {
      title: @post.title,
      type: 'website',
      image: rails_blob_url(@post.header_image),
      url: url_for(@post)
    }
  end
end
