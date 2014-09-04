class BusinessesController < ApplicationController
    load_and_authorize_resource

    helper_method :sort_column, :sort_direction

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
      @hash = Gmaps4rails.build_markers(@business) do |business, marker|
        marker.lat business.latitude
        marker.lng business.longitude
        marker.title business.title
      end
    end

    def index
      @businesses = Business.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 10)
      #@businesses = Business.all.order(:title)
      #@businesses = @businesses.paginate(page: params[:page], per_page: 10)
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
        params.require(:business).permit(:title, :text, :street ,:map_heading, :city, :state, :zip_code, 
          :telephone, :website, :op_hours, :category, :longitude, :latitude, :gmaps)
    end

    def sort_column
      Business.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
