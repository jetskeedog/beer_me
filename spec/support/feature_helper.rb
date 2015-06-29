module FeatureHelper
  
  def sign_in_user(username, password)
     visit '/users/sign_in'
     user = create(:user)
     fill_in "Username", with: user.username
     fill_in "Password", with: user.password
     click_button "Log in"
  end
  
  def create_beer(title, name, beer_pic)
    visit 'beers/new'
    fill_in "Title", with: "IPA"
    fill_in "Name", with: "Lagunitas"
    attach_file "Beer pic", "spec/images/test_beer.JPG"
  end
  
    
  RSpec.configure do |config|
    config.include FeatureHelper
  end
end