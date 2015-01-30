class BusinessesController < ApplicationController
    load_and_authorize_resource
    before_filter :check_for_cancel, :only => [:index]

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
      @business = Business.find(params[:id])
      @reviews = @business.reviews.reverse_order.paginate(page: params[:page], per_page: 10)
    end

    def index
      if params[:search]
        @businesses = Business.search(params[:search]).page(params[:page])
      else
        @businesses = Business.all.page(params[:page])
      end
    end

    def check_for_cancel
      if params[:commit] == "Clear"
        redirect_to businesses_path
      end
    end

    def edit
      @business = Business.find(params[:id])
    end

    def update
      @business = Business.find(params[:id])
     
      if @business.update(business_params)
        redirect_to @business
        flash[:notice] = "Business updated."
      else
        render 'edit'
      end
    end

    def destroy
      #@business = Business.find(params[:id])
      @business.destroy
      redirect_to businesses_path
      flash[:notice] = "Business deleted."
    end

    private

    def business_params
      params.require(:business).permit(:title, :street ,:map_heading, :city, :state, :zip_code, 
        :telephone, :website, :category_id, :longitude, :latitude)
    end
end
