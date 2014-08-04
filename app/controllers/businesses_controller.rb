class BusinessesController < ApplicationController
    load_and_authorize_resource
    #skip_authorization_check
    #skip_before_action :authenticate_user!

    def new
        @business = Business.new
    end

    def create
        @business = Business.new(business_params)
     
        if @business.save
            redirect_to @business
            flash[:notice] = 'New business created.'
        else
            render 'new'
        end
    end

    def show
      #@business = Business.find(params[:id])
    end

    def index
      @business = Business.all
    end

    def edit
      #@business = Business.find(params[:id])
    end

    def update
      #@business = Business.find(params[:id])
     
      if @business.update(business_params)
        redirect_to @business
      else
        render 'edit'
      end
    end

    def destroy
      #@business = Business.find(params[:id])
      @business.destroy
     
      redirect_to businesses_path
    end

    private
    def business_params
        params.require(:business).permit(:title, :text, :street_no, :street, :city, :zip_code,
          :country, :telephone, :website, :op_hours, :category)
    end

end
