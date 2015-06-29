require 'spec_helper'
require 'factory_girl_rails'

  describe "A user signs in" do
    it "and votes up a beer post" do
      sign_in_user 'username', 'password'
      create_beer 'title', 'name', 'beer_pic'

      click_link 'up'

      expect(page).to have_content("Thanks for the vote")
    end
  end 
