class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :ballance, :balance
  end

  def self.down
  end
end
