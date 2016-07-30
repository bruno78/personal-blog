class PostsController < ApplicationController

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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :blurb, :body, :all_tags))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :blurb, :body, :all_tags)
    end

end
