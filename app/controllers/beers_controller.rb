class BeersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  
  def show
    @beer = Beer.find(params[:id])
  end

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user_id = current_user.id

    
    if @beer.save
      flash[:success] = "Cheers, your beer was added!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  
  private
  
  def beer_params
    params.require(:beer).permit(:title, :name, :description, :beer_pic)
  end
  
  def set_beer
    @beer = Beer.find(params[:id])
  end

end

