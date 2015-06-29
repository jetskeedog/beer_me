class StaticPagesController < ApplicationController
  def home
    @beer = current_user.beers.build if user_signed_in?
    @beers = Beer.all
  end

  def about
  end

  def privacy
  end

  def contact
  end
end
