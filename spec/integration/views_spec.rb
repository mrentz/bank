require 'spec_helper'

describe "ViewLinks" do

  it "should have the List page as root" do
    get '/'
    response.should render_template('users/list')
  end

  it "should have a New page at '/new'" do
    get '/new'
    response.should render_template('users/new')
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Add new User"
    response.should render_template('users/new')
  end

  it "should have the right links for buttons" do
    visit new_path
    fill_in "First Name", :with => "fred"
    fill_in "Last Name", :with => "wilma"
    fill_in "email", :with => "name@sdf.com"
    click_button "Create"
    response.should render_template('users/list')
  end
  
  it "should have a first_name field" do
    visit new_path
    response.should have_selector("input[id='user_first_name']")
    response.should have_selector("input[name='user[first_name]']")
  end

end
