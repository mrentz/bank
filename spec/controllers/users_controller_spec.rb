require 'spec_helper'

describe UsersController do

  integrate_views

  #Delete these examples and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'users/new'
      response.should be_success
    end

    it "should have the right heading" do
      get 'users/new'
      response.should have_tag("h1", /Add new/)
    end
  end  

  context "A user (in general)" do
    setup do
      @user = User.new
    end
  end
end
