class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index

    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
              .paginate(:page => params[:page], :per_page => 3)
              .order('created_at DESC')
    else
      @posts = Post.page(params[:page])
              .paginate(:page => params[:page], :per_page => 3)
              .order('created_at DESC')
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    if @post.update(params[:post].permit(:title, :blurb, :body, :all_tags, :image, :remote_image_url))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :blurb, :body, :all_tags, :image, :remote_image_url)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
