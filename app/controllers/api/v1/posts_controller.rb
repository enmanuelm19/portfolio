class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :update, :destroy]

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
      render json: { message: 'Post creado exitosamente', post: @post }, status: :created
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: { message: 'Post actualizado exitosamente', post: @post }
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  def destroy
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
