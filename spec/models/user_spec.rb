# == Schema Information
# Schema version: 20101015043618
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first_name :string(20)      not null
#  last_name  :string(20)      not null
#  created_at :datetime
#  email      :string(255)
#

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
  
  valid_emails = ["email@address.one", "email2@address.one.two"]
  valid_emails.each do |email|  
    it "should accept a valid email address" do
      no_name_user = User.new(@valid_attributes.merge(:email => email))
      no_name_user.should be_valid
    end
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@valid_attributes)
    user_with_duplicate_email = User.new(@valid_attributes)
    user_with_duplicate_email.should_not be_valid
  end
  
end
