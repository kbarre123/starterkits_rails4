class ReviewsController < ApplicationController
    load_and_authorize_resource

    before_filter :load_business
    
    def new
        @review = @business.reviews.build(review_params)
    end

    def index
    end

    def create
        @review = @business.reviews.create(review_params)
        @review.user_id = current_user.id
        @review.reviewer = current_user.first_name + ' ' + current_user.last_name
        
        if @review.save
            redirect_to business_path(@business)
            flash[:notice] = 'Review posted!'
        else
            redirect_to business_path(@business)
            flash[:danger] = 'Your review has an error. Please double check!'
        end
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        if @review.update_attributes(review_params)
            redirect_to business_path(@business)
            flash[:notice] = 'Review updated!'
        else
            render :action => 'edit'
        end
    end

    def destroy
        @review = @business.reviews.find(params[:id])
        @review.destroy
        redirect_to business_path(@business)
        flash[:notice] = "Review deleted."
    end

    private

    def load_business
        @business = Business.find(params[:business_id])
    end

    def review_params
      params.require(:review).permit(:review, :rating)
    end
end
