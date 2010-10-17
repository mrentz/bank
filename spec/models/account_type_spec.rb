# == Schema Information
# Schema version: 20101015043618
#
# Table name: account_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe AccountType do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    AccountType.create!(@valid_attributes)
  end
end
