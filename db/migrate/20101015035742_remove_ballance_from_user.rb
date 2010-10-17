class RemoveBallanceFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :ballance
  end

  def self.down
    add_column :users, :ballance, :float
  end
end
