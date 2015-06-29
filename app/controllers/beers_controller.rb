class BeersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: :destroy
  
  def show
    @beer = Beer.find(params[:id])
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @beer = Beer.find(params[:id])
    @beer.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for the vote"
  end

  def index
    @beers = Beer.paginate(:page => params[:page], :per_page => 25)
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user_id = current_user.id

    
    if @beer.save
      flash[:success] = "Cheers, your beer was added!"
      redirect_to @beer
    else
      render 'new'
    end
  end
  
  def destroy
    @beer.destroy
    flash[:success] = "Beer deleted"
    redirect_to request.referrer || root_url
  end

  
  
  private
  
  def beer_params
    params.require(:beer).permit(:title, :name, :description, :beer_pic)
  end
  
  def set_beer
    @beer = Beer.find(params[:id])
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end

