class ReviewsController < ApplicationController
    skip_authorization_check
    skip_before_action :authenticate_user!
  
    def create
    @business = Business.find(params[:business_id])
    @review = @business.reviews.create(review_params)
    flash[:notice] = 'Review posted!'
    redirect_to business_path(@business)
    end

    private
    def review_params
      params.require(:review).permit(:reviewer, :review, :rating)
    end
end
