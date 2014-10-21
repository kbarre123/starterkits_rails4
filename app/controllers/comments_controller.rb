class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  # GET /comments/new
  def new
    @comment = @commentable.comments.new
  end

  # GET /comments/1/edit
  #def edit
  #  @comment = Comment.find(params[:id])
  #end

  # POST /comments
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @commentable
      flash[:notice] = 'Comment was successfully created.'
    else
      render :new
      flash[:danger] = 'Your review has an error. Please double check!'
    end
  end

  # PATCH/PUT /comments/1
  def update
    @comment = @commentable.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @commentable
      flash[:notice] = 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable
    flash[:notice] = 'Comment was successfully destroyed.'
  end

  private

    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    #def load_post
    #    @post = Post.find(params[:post_id])
    #end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:text, :commentable_id, :commentable_type)
    end
end
