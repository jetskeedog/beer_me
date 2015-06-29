class UsersController < ApplicationController
  before_action :correct_user, only: :destroy

  
  def show
    @user = User.find(params[:id])
    @beers = @user.beers.paginate(:page => params[:page], :per_page => 25)
  end

  def index
    @users = User.paginate(:page => params[:page], :per_page => 25)
  end

  
  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
  
end