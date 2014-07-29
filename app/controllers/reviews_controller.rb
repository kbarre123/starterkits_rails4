class ReviewsController < ApplicationController
    load_and_authorize_resource
    #skip_authorization_check
    #skip_before_action :authenticate_user!
    
    def new
        #@review = Review.new
    end

    def create
        @business = Business.find(params[:business_id])
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
    end

    def update
        if @review.update_attributes(review_params[:review])
            flash[:notice] = "Review updated."
            redirect_to business_path(@business)
        else
            render :action => 'edit'
        end
    end

    def destroy
        @review.destroy
        flash[:notice] = "Review deleted."
        redirect_to business_path(@business)
    end

    private
    def review_params
      params.require(:review).permit(:reviewer, :review, :rating)
    end
end
