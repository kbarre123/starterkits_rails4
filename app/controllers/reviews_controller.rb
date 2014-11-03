class ReviewsController < ApplicationController
    load_and_authorize_resource
    #skip_authorize_resource :only => [:upvote, :downvote]
    #skip_authorization_check :only => [:upvote, :downvote]
    
    def new
        @business = Business.find(params[:business_id])
        @review = @business.reviews.build(review_params)
    end

    def index
        @reviews = Review.all.reverse_order.paginate(page: params[:page], per_page: 10, 
            :total_entries => 20)
    end

    def show
        @review = Review.find(params[:id])
        @commentable = @review
        @comments = @commentable.comments.reverse_order.paginate(page: params[:page], per_page: 10)
        @comment = Comment.new
    end

    def edit
        @review = Review.find(params[:id])
    end

    def create
        @business = Business.find(params[:business_id])
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
            redirect_to review_path(@review)
            flash[:notice] = 'Review updated!'
        else
            render :action => 'edit'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
            if URI(request.referer).path == user_home_path
                redirect_to :back
            else
                redirect_to business_path(@review.business)
            end
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

    def review_params
        params.require(:review).permit(:review, :rating)
    end

end
