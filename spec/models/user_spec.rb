require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :first_name => "first_name",
      :last_name => "last_name",
      :email => "value@for.email.mof",
      :ballance => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  it "should require a name" do
    no_name_user = User.new(@valid_attributes)
    no_name_user.should be_valid
  end


  it "should require a first name" do
    no_name_user = User.new(@valid_attributes.merge(:first_name => ""))
    no_name_user.should_not be_valid
  end

  it "should require a first name under 12 characters" do
    no_name_user = User.new(@valid_attributes.merge(:first_name => "abcdefghiklmn"))
    no_name_user.should_not be_valid
  end

  it "should require a valid email" do
    no_name_user = User.new(@valid_attributes.merge(:email => "asdffds"))
    no_name_user.should_not be_valid
  end

end
