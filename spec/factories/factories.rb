Factory.define :user do |user|
  user.add_attribute :id, 1
  user.add_attribute :first_name, "Fred"
  user.add_attribute :last_name, "Flintstone"
  user.add_attribute :email, "fred@boulder.com"
end

Factory.define :account do |account|
  account.add_attribute :balance,  1.5
  account.add_attribute :type_id,   1
  account.add_attribute :user_id,   2
end

Factory.define :account_type do |account_type|
  account_type.add_attribute :id,   1
  account_type.add_attribute :name,   "slugger"
end
