class RemoveAccountFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :account_no
  end

  def self.down
    add_column :users, :account_no, :integer
  end
end
