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

class AccountType < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  validates_presence_of :name
end
