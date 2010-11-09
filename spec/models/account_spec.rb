# == Schema Information
# Schema version: 20101015043618
#
# Table name: accounts
#
#  id         :integer         not null, primary key
#  ballance   :float
#  created_at :datetime
#  updated_at :datetime
#  type_id    :integer
#  user_id    :integer
#

require 'spec_helper'

describe Account do
  before(:each) do
    @bank_account = Factory(:account)
    @valid_attributes = 
      {
      :ballance => 1.5,
      :type_id => 1,
      :user_id => 2
    }
  end

  it "should create a new instance given valid attributes" do
    Account.create!(@valid_attributes)
  end

  it "ballance should be the value defined in the factory " do
    @bank_account.ballance.should == 1.5
  end


end
