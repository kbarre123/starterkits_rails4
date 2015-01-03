class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all.reverse_order.paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments.reverse_order.paginate(page: params[:page], per_page: 10)
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path
      flash[:notice] = 'New post created.'
    else
      render 'new'
      flash[:danger] = 'Your post has an error. Please double check!'
    end
  end

  def update
    @post = Post.find(params[:id])
   
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = "Post updated."
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "Post deleted."
  end

  private

  def post_params
      params.require(:post).permit(:text)
  end
end
