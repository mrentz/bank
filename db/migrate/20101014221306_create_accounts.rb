class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :type
      t.float :ballance

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
