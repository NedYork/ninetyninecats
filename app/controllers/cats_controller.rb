class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @requests = CatRentalRequest.where(cat_id: @cat.id).order(:start_date)
    render :show
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :name, :sex, :description, :color)
  end
end
