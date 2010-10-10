class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|

      t.column :first_name, :string, :limit => 20, :null => false
      t.column :last_name, :string, :limit => 20, :null => false
      t.column :account_no, :integer
      t.column :ballance, :float
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
