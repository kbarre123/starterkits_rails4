class ReviewsController < ApplicationController
    skip_authorization_check
    skip_before_action :authenticate_user!
    
    def create
        @business = Business.find(params[:business_id])
        @review = @business.reviews.create(review_params)
        if @review.save
            redirect_to business_path(@business)
            flash[:notice] = 'Review posted!'
        else
            redirect_to business_path(@business)
        end
    end

    private
    def review_params
      params.require(:review).permit(:reviewer, :review, :rating)
    end
end
