class RemoveUserToAccount < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :user_id
  end

  def self.down
    add_column :accounts, :user_id, :string
  end
end
