class UsersController < ApplicationController
  load_and_authorize_resource

    def show
        @user = params[:id].blank? ? current_user : User.find(params[:id])
        @reviews = Review.where(user_id: @user.id).reverse_order
        @reviews = @reviews.paginate(page: params[:page], per_page: 10)
    end
    
end
