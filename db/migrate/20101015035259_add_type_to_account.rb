class AddTypeToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :type_id, :integer
  end

  def self.down
    remove_column :accounts, :type_id
  end
end
