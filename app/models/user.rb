class User < ActiveRecord::Base

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_uniqueness_of :email
  validates_format_of :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_numericality_of :ballance, :message=>"Error Message"

end
