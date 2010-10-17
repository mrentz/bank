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

class Account < ActiveRecord::Base
belongs_to :user
has_one :account_type
validates_numericality_of :ballance
end
