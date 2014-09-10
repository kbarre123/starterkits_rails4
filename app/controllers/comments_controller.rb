class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  before_filter :load_post

  # GET /comments/new
  def new
    @comment = @post.comments.build(comment_params)
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to posts_path(@post)
      flash[:notice] = 'Comment was successfully created.'
    else
      redirect_to posts_path(@post)
          flash[:danger] = 'Your review has an error. Please double check!'
    end
  end

  # PATCH/PUT /comments/1
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post)
      flash[:notice] = 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_url
    flash[:notice] = 'Comment was successfully destroyed.'
  end

  private

    def load_post
        @post = Post.find(params[:post_id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:text)
    end
end
