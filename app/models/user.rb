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

class User < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :first_name
  validates_length_of :first_name, :within => 1..12
  validates_presence_of :last_name
  validates_length_of :last_name, :maximum => 12

end
