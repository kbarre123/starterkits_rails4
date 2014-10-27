class ReviewsController < ApplicationController
    load_and_authorize_resource
    #skip_authorize_resource :only => [:upvote, :downvote]
    #skip_authorization_check :only => [:upvote, :downvote]

    before_filter :load_business
    
    def new
        @review = @business.reviews.build(review_params)
    end

    def index
    end

    def show
        @review = @business.reviews.find(params[:id])
        @commentable = @review
        @comments = @commentable.comments.reverse_order.paginate(page: params[:page], per_page: 10)
        @comment = Comment.new
    end

    def edit
        @review = Review.find(params[:id])
    end

    def create
        @review = @business.reviews.create(review_params)
        @review.user_id = current_user.id
        
        if @review.save
            redirect_to business_path(@business)
            flash[:notice] = 'Review posted!'
        else
            redirect_to business_path(@business)
            flash[:danger] = 'Your review has an error. Please double check!'
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.update_attributes(review_params)
            redirect_to business_review_path(@business, @review)
            flash[:notice] = 'Review updated!'
        else
            render :action => 'edit'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to business_path(@business)
        flash[:notice] = "Review deleted."
    end

    #def upvote
    #    @review = Review.find(params[:id])
    #    @review.liked_by current_user
    #    redirect_to business_path(@business)
    #    flash[:notice] = 'Review upvoted!'
    #end

    #def downvote
    #    @review = Review.find(params[:id])
    #    @review.downvote_from current_user
    #    redirect_to business_path(@business)
    #    flash[:notice] = 'Review downvoted!'
    #end

    private

    def load_business
        @business = Business.find(params[:business_id])
    end

    def review_params
        params.require(:review).permit(:review, :rating)
    end

end
