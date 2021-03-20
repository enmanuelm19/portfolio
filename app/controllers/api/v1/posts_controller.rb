class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :delete]

  def index
    @posts = Post.where(created_at: 1.day.ago..Time.now)
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: { message: 'Post creado exitosamente' }, state: :created
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: { message: 'Post actualizado exitosamente' }
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  def delete
    @post.destroy
    return { message: 'Post eliminado exitosamente' }
  end

  private

    def set_post
      @post = Post.where(created_at: 1.day.ago..Time.now).find(params[:id])
    end

    def post_params
      params.permit(:title, :content, :user_id)
    end
end
