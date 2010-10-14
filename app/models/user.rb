# == Schema Information
# Schema version: 20101013042215
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first_name :string(20)      not null
#  last_name  :string(20)      not null
#  account_no :integer
#  ballance   :float
#  created_at :datetime
#  email      :string(255)
#

class User < ActiveRecord::Base

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :first_name
  validates_length_of :first_name, :within => 1..12
  validates_presence_of :last_name
  validates_length_of :last_name, :within => 1..12
  validates_numericality_of :ballance, :message=>"Error Message"

end
