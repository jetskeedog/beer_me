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
    
    fill_in "Title", with: "Great summer beer"
    fill_in "Name", with: "Bud Light"
    fill_in "Description", with: "This was taken in my kitchen, oh how I miss the summer."
    attach_file "Beer pic", "spec/images/test_beer.JPG"
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

describe "Successful post from home page" do
  it "post is successful" do
    
    sign_in_user 'username', 'password'
    page.should have_content('Signed in successfully.')
    
    visit "/"
    fill_in "Title", with: "Great summer beer"
    fill_in "Name", with: "Bud Light"
    fill_in "Description", with: "This was taken in my kitchen, oh how I miss the summer."
    attach_file "Beer pic", "spec/images/test_beer.JPG"
    click_button "Add Beer"
    
    page.should have_content('Cheers, your beer was added!')
  end
end

