# -*- coding: utf-8 -*-
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

    
  it "should have the right form for new users" do
    visit 'users/new'
    #    puts response.body
    response.should contain(/First name/i)
    fill_in "user_first_name", :with => "barney"
    fill_in "user_last_name", :with => "rubble"
    fill_in "user_email", :with => "name@sdf.com"
    click_button "Create"
    response.should render_template('users/list')
  end
  
  it "should have a first_name field for the new users page" do
    visit 'users/new'
    response.should have_selector("input[id='user_first_name']")
    response.should have_selector("input[name='user[first_name]']")
    response.should have_selector("label[for='user_First Name:']")
  end
  
  describe "user data" do
    before(:each) do
      @new_user = Factory(:user)
      @acc_type = Factory(:account_type)
      @account = Factory(:account)
      User.stub!(:find, @new_user.id).and_return(@new_user)
    end
    
    it "should have the page for listing users" do
      visit 'users/show'
      response.should render_template("users/show")
      response.should contain(@new_user.first_name)
    end    
    
    it "should lead to the new account page for the specific user" do
      visit 'users/show'
      response.should contain(@new_user.first_name)
      response.should contain(/add new account/i)
      click_link /add new account/i
      response.should render_template('account/new')
#    end
#    
#    it "should create a new account for the user" do
#      visit "account/new"
#      response.should render_template('account/new')
      response.should contain(/Create new Account For/i)
      response.should contain(@new_user.first_name)
      response.should contain(@new_user.last_name)
      fill_in /Ballance/i, :with => "100"
      select @acc_type.name, :from => "account[type_id]"
      click_button "Create"
      response.should be_success
      response.should render_template('account/list')
      flash[:success].should =~ /New Account Successfully Created/i
      response.should have_tag("a", "Acc. No: #{@account.id}")
      click_link "Acc. No: #{@account.id}"
      response.should render_template('account/show')
      response.should contain("#{@new_user.first_name} #{@new_user.last_name}")
      response.should have_tag("a", /calculator/i)
      click_link "calculator"
      response.should render_template('account/calc')
      click_link "Back"
      response.should render_template('account/show')
 #     puts response.body
      response.should have_tag("a", /Deposit/i)
      click_link "Deposit"
      response.should render_template('account/atm')
      click_button "clear"
##      click_button "1"
    end
    
    it "should remain on page if no balance is selected" do
      visit "account/new"
      fill_in /ballance/i, :with => ""
      click_button "Create"
      response.should render_template('account/new')
      flash[:fail].should =~ /Account creation was unsuccessful/i
      response.should contain(/errors/i)
      response.should contain(@new_user.first_name)
      response.should contain(@new_user.last_name)
    end

#    it "should show a list of users" do
#      get "/"
#      response.should render_template("users/list")
#      response.should contain(/These are the current users in our system/)
#      response.should have_tag("a")
#      puts response.body
#      response.should have_tag("li")
#      response.should have_tag("a", /Add new User/i)
#      response.should have_tag("a", :text => "Add new User")
#    end

    it "should show a list of accounts for a user" do
      get "account/show/#{@account.id}"
      response.should contain(/Account/)
      response.should contain("Account: #{@account.id}")
      response.should contain(/Created date/i)
      response.should contain(@new_user.first_name)
      response.should contain(@new_user.last_name)
      response.should have_tag("a", /edit/i)
      response.should have_tag("a", "Deposit")
    end
  
#    it "should have a working calculator" do
#      visit "account/calc/#{@account.id}"
#      response.should render_template('account/calc')
#      click_button "1"
#      click_button "+"
#      click_button "1"
#      click_button "1"
#      click_button "1"
#      click_button "="
#      response.should contain("112")
#      click_link "Back"
#      response.should render_template('account/show')
#    end
  end
end
