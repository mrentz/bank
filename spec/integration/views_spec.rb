require 'spec_helper'

describe "ViewLinks" do

  it "should have the List page as root" do
    get '/'
    response.should render_template('users/list')
  end

  it "should have a New page at 'users/new'" do
    get 'users/new'
    response.should render_template('users/new')
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Add new User"
    response.should render_template('users/new')
  end

  it "should go to the right page" do
    visit 'users/new'
    response.should render_template('users/new')
  end

  it "should stay on the same page" do
    visit 'users/new'
    click_button "Create"
    response.should render_template('users/new')
  end

it "should have the right links for buttons" do
    visit 'users/new'
#    puts response.body
    fill_in "user_first_name", :with => "fred"
    puts "\n\n\n"
    fill_in "user_last_name", :with => "wilma"
    fill_in "user_email", :with => "name@sdf.com"
    click_button "Create"
    response.should render_template('users/list')
  end
  
  it "should have a first_name field" do
    visit 'users/new'
    response.should have_selector("input[id='user_first_name']")
    response.should have_selector("input[name='user[first_name]']")
    response.should have_selector("label[for='user_First Name:']")
  end

end
