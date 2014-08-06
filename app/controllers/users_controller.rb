class UsersController < ApplicationController
  load_and_authorize_resource

    def show
        @user = params[:id].blank? ? current_user : User.find(params[:id])
    end
    
end
