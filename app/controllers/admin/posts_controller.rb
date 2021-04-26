class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: %i[show destroy edit update]
  def index
    @q = Post.ransack(query_params)
    @posts = @q.result.includes(:user).page(params[:page])
  end

  def show; end

  def edit; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to admin_posts_path, notice: 'Post creado satisfactoriamente.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: 'Post editado satisfactoriamente.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: 'Post eliminado satisfactoriamente'
  end

  private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :published, :header_image, :locale, :body)
    end
end
