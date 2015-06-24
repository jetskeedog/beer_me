require 'spec_helper'
require 'factory_girl_rails'

describe "Unsuccessful post without signing in" do
  it "redirects to the sign in page" do
    visit "/beers/new"
    page.should have_content('You need to sign in or sign up before continuing.')
  end
end

describe "Successful post with sign in after" do
  it "post is successful" do
    visit "/beers/new"
    sign_in_user 'username', 'password'
    page.should have_content('Signed in successfully.')
    
    fill_in "Title", with: "Greate summer beer"
    click_button "Add Beer"
    
    page.should have_content('Cheers, your beer was added!')
  end
end

describe "Post unsuccessful without title" do
  it "displays correct error" do
    sign_in_user 'username', 'password'
    visit "/beers/new"
   
    click_button "Add Beer"
    
    page.should have_content("Title can't be blank")
  end
end

