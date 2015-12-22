class CatRentalRequestsController < ApplicationController
  def new
    @request = CatRentalRequest.new
    @cats = Cat.all

    render :new
  end

  def create
    @request = CatRentalRequest.new(request_params)
    @cats = Cat.all
    
    if @request.save
      fail
      redirect_to cat_rental_request_url(@request)
    else
      render :new
    end
  end
  #
  # def show
  #   fail
  # end

  # def show
  #   @request = CatRentalRequest.find(params[:id])
  #   render :show
  # end
  #
  # def index
  #   @requests = CatRentalRequest.all
  # end

  private
    def request_params
      params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
    end
end
